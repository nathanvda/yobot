$:.push File.expand_path("../lib", __FILE__)
require "yobot/version"

Gem::Specification.new do |s|
  s.name = "yobot"
  s.summary = %Q{An extensible campfire bot.}
  s.email = "alex@upstre.am"
  s.homepage = "http://github.com/langalex/yobot"
  s.description = "Sits in a campfire room and waits for command. Add custom behaviors to make him do anything you want."
  s.authors = ["Alexander Lang"]
  s.version     = Yobot::VERSION
  s.platform    = Gem::Platform::RUBY
  
  s.add_dependency 'eventmachine'
  s.add_dependency 'firering'
  
  s.add_development_dependency 'rspec', '>=2.0'
  s.add_development_dependency 'rake'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
