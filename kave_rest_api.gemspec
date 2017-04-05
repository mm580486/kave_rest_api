# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kave_rest_api/version'

Gem::Specification.new do |spec|
  spec.name          = "kave_rest_api"
  spec.version       = KaveRestApi::VERSION
  spec.authors       = ["mohammad mahmoudi"]
  spec.email         = ["mm580486@gmail.com"]

  spec.summary       = %q{Ruby gem to send and receive SMS via kavenegar API(rest) }
  spec.description   = %q{
    Ruby gem to send and receive SMS via kavenegar API(rest)
    kavenegar is great services for send and receive sms this service has a some feature like verification sms or voice service , etc
  }
  spec.homepage      = "https://github.com/mm580486/kave_rest_api/"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 1.9.3'
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #   f.match(%r{^(test|spec|features)/})
  # end
  spec.files = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"  
  spec.add_dependency "json"
  spec.add_dependency "feedjira"
  spec.add_dependency "validatable",'~> 1.6'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
