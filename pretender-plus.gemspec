require_relative "lib/pretender-plus/version"

Gem::Specification.new do |spec|
  spec.name          = "pretender-plus"
  spec.version       = PretenderPlus::VERSION
  spec.summary       = "Log in as another user in Rails"
  spec.homepage      = "https://github.com/enercoop/pretender-plus"
  spec.license       = "MIT"

  spec.author        = "Pierre de La Morinerie"
  spec.email         = "kemenaran@gmail.com"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 3.2"

  spec.add_dependency "actionpack", ">= 7.1"
end
