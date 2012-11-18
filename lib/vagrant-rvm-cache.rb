require 'vagrant-rvm-cache/version'
require 'vagrant-rvm-cache/share_rvm_archives'

Vagrant.actions[:start].insert_before(Vagrant::Action::VM::ShareFolders, RvmCache::ShareRvmArchives)

