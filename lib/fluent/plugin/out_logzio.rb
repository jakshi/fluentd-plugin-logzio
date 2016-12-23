module Fluent
  class LogzioOutput < Fluent::Output
    Fluent::Plugin.register_output('logzio', self)
    config_param :endpoint_url, :string, default: nil

    def configure(conf)
      super
      $log.debug "Logzio url #{@endpoint_url}"
    end

    def start
      super
      require 'net/http/persistent'
      @uri = URI @endpoint_url
      @http = Net::HTTP::Persistent.new 'fluent-plugin-logzio-ng', :ENV
      @http.headers['Content-Type'] = 'application/json'
    end

    def shutdown
      super
    end

    def emit(tag, es, chain)
      chain.next
      es.each {|time,record|
        record_json = record.to_json
        $log.debug "Record sent #{record_json}"
        post = Net::HTTP::Post.new @uri.request_uri
        post.body = record_json
        begin
          response = @http.request @uri, post
          $log.debug "HTTP Response code #{response.code}"
          $log.error response.body if response.code != '200'
        rescue StandardError
          $log.error "Error connecting to logzio verify the url #{@endpoint_url}"
        end
      }
    end
  end
end
