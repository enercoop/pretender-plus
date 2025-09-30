require_relative "lib/pretendest/version"

Gem::Specification.new do |spec|
  spec.name          = "pretendest"
  spec.version       = Pretendest::VERSION
  spec.summary       = "Log in as another user in Rails - with extra features"
  spec.homepage      = "https://github.com/enercoop/pretendest"
  spec.license       = "MIT"

  spec.author        = "Pierre de La Morinerie"
  spec.email         = "kemenaran@gmail.com"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 3.2"

  spec.add_dependency "actionpack", ">= 7.1"
end
