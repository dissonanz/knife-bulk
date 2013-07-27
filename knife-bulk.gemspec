$:.push File.expand_path("../lib", __FILE__)
require 'knife-bulk/version'

Gem::Specification.new do |s|
  s.name            = "knife-bulk"
  s.version         = Knife::Bulk::VERSION
  s.platform        = Gem::Platform::RUBY
  s.has_rdoc        = false
  s.authors         = ["Sean Nolen"]
  s.email           = ["sean@forgettingtolive.com"]
  s.homepage        = ""
  s.summary         = "add search option to knife commands"
  s.description     = "Modifies 'knife node run_list add|remove' to incorporate search"
  s.required_ruby_version   = ">= 1.9.1"

  s.files           = `git ls-files`.split("\n")
  s.executables     = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths   = ["lib"]
end
