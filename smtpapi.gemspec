# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smtpapi/version'

Gem::Specification.new do |spec|
  spec.name          = "smtpapi"
  spec.version       = Smtpapi::VERSION
  spec.authors       = ["Wataru Sato"]
  spec.email         = ["awwa500@gmail.com"]
  spec.summary       = %q{Smtpapi library for SendGrid.}
  spec.description   = %q{Smtpapi library for SendGrid.}
  spec.homepage      = "https://github.com/sendgridjp/smtpapi-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
