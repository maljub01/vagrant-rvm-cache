# Maintain your gem's version:
$:.unshift File.expand_path("../lib", __FILE__)
require "vagrant-rvm-cache/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vagrant-rvm-cache"
  s.version     = RvmCache::VERSION
  s.authors     = ["Marwan Al Jubeh"]
  s.email       = ["marwan.al.jubeh@gmail.com"]
  s.homepage    = "http://github.com/maljub01/vagrant-rvm-cache"
  s.summary     = "A Vagrant plugin to share RVM's downloaded files between different guest VMs with the same Vagrant box"
  s.description = "Vagrant RVM cache allows you to save time and network bandwidth by avoiding unnecessarily re-downloading RVM packages by sharing RVM's archives directory between different guest VMs with the same Vagrant box."

  s.files = Dir["{files,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
