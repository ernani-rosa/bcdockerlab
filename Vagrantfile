# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

nodes = 3

Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|

    master.vm.box = "bento/ubuntu-22.04"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "10.0.1.100"
    master.vm.synced_folder "./data", "/vagrant_data"
    master.vm.provider "virtualbox" do |vb|    
      # Customize the amount of memory on the VM:
      vb.name = "master"
      vb.memory = "512"
      vb.cpus = 1
    end

   master.vm.provision "shell", path: "master.sh"

  end

  (1..nodes).each do |i|

    config.vm.define "node0#{i}" do |node|
      node.vm.box = "bento/ubuntu-22.04"
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "10.0.1.#{i+100}"
      node.vm.synced_folder "./data", "/vagrant_data"

      node.vm.provider "virtualbox" do |vb|    
        vb.name = "node#{i}"
        vb.memory = "512"
        vb.cpus = 1
      end

     node.vm.provision "shell", path: "node.sh"
    end

  end

end
