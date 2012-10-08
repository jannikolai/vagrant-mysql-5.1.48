# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.customize ["modifyvm", :id, "--memory", 512]

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 3306, 3308


  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  #
   config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "./cookbooks"
     chef.roles_path = "./roles"
     chef.data_bags_path = "./data_bags"
     
     chef.add_recipe "sis"
     #chef.add_role "web"
  
    #  You may also specify custom JSON attributes:
    #   chef.json = { :mysql_password => "foo" }
  end


end
