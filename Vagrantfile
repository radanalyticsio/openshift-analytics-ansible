# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Must install 'vagrant plugin install vagrant-env' for this to work
  # Also install ' vagrant plugin install vagrant-hostmanager'
  config.ssh.insert_key = false

   config.vm.define "openshiftsparkvm" do |openshiftsparkvm|
     openshiftsparkvm.vm.hostname = "analytics.openshift.com"
     openshiftsparkvm.vm.box = "bento/centos-7.1"
     openshiftsparkvm.vm.network "private_network", ip: "192.168.33.10"
         openshiftsparkvm.vm.provider "virtualbox" do |v|
           v.name = "openshiftspark"
           v.cpus = "1"
           v.memory = "2048"
     end

       # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
       openshiftsparkvm.vm.provision :file do |file|
         file.source      = "~/.vagrant.d/insecure_private_key"
         file.destination = "/home/vagrant/.ssh/id_rsa"
       end

       openshiftsparkvm.vm.provision "ansible" do |ansible|
              ansible.playbook       = "site.yml"
              ansible.verbose        = true
              ansible.limit          = "all" # or only "nodes" group, etc.
              ansible.inventory_path = "inventory.yml"
       end
    end

end
