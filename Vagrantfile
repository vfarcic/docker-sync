# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.define "source" do |node|
    node.vm.hostname = "source"
    node.vm.network "private_network", ip: "10.101.199.201"
    node.vm.provision "docker", images: ["vfarcic/sync"]
  end
  config.vm.define "destination" do |node|
    node.vm.hostname = "destination"
    node.vm.network "private_network", ip: "10.101.199.202"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end