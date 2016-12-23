# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'fluent-plugin-logzio-ng'
  s.version     = '0.0.7'
  s.authors     = ['Yury Kotov', 'Roi Rav-Hon']
  s.email       = ['bairkan@gmail.com', 'roi@logz.io']
  s.homepage    = 'https://github.com/logzio/fluent-plugin-logzio-ng'
  s.summary     = %q{Fluentd plugin for output to Logz.io}
  s.description = %q{Fluentd pluging (fluent.org) for output to Logz.io (logz.io)}
  s.license     = 'Apache-2.0'

  s.rubyforge_project = 'fluent-plugin-logzio-ng'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
  s.required_ruby_version = Gem::Requirement.new('>= 1.9.3')

  s.add_dependency 'net-http-persistent', '~> 2.7'
  s.add_dependency 'fluentd', '~> 0.12'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'test-unit', '~> 3.1'
end
