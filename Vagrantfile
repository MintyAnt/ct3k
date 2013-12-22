# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

mysql_settings = {
  :mysql => {
    :bind_address => "192.168.33.33",
    :server_root_password =>"pwd",
    :server_debian_password =>"pwd",
    :server_repl_password =>"pwd",
    :user_password =>"pwd",
  }
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ct3k_database"
	config.vm.box_url = "http://files.vagrantup.com/precise32.box"
	config.vm.network :private_network, ip: "192.168.33.33"
	#config.vm.network :hostonly, "192.168.33.33"
	#config.vm.network :forwarded_port, host: 3306, guest: 3306
	#config.vm.network :forwarded_port, host: 4567, guest: 80
	
	config.vm.provision :chef_solo do |chef|
		chef.json = mysql_settings
		chef.add_recipe "ct3k::ct3k_database"
	end
end
