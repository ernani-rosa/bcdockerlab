# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

workers = 3

Vagrant.configure("2") do |config|

  config.vm.define "manager" do |manager|

    manager.vm.box = "bento/ubuntu-22.04"
    manager.vm.hostname = "manager"
    manager.vm.network "private_network", ip: "10.0.1.100"
    manager.vm.synced_folder "./data", "/vagrant_data"
    manager.vm.provider "virtualbox" do |vb|    
      # Customize the amount of memory on the VM:
      vb.name = "manager"
      vb.memory = "512"
      vb.cpus = 1
    end

   manager.vm.provision "shell", path: "manager.sh"

  end

  (1..workers).each do |i|

    config.vm.define "worker#{i}" do |worker|
      worker.vm.box = "bento/ubuntu-22.04"
      worker.vm.hostname = "worker#{i}"
      worker.vm.network "private_network", ip: "10.0.1.#{i+100}"
      worker.vm.synced_folder "./data", "/vagrant_data"

      worker.vm.provider "virtualbox" do |vb|    
        vb.name = "worker#{i}"
        vb.memory = "512"
        vb.cpus = 1
      end

     worker.vm.provision "shell", path: "worker.sh"
    end

  end

end
