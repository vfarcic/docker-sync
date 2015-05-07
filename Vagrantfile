# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  (1..2).each do |i|
    config.vm.define "sync-0#{i}" do |node|
      node.vm.hostname = "sync-0#{i}"
      node.vm.network "private_network", ip: "10.101.199.20#{i}"
      node.vm.provision :hosts
    end
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end