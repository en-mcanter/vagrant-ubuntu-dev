# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "55.55.55.102"
  config.vm.synced_folder ".", "/home/vagrant/shared/"
  #config.vm.synced_folder "./remote/puppet", "/etc/puppet/"
  $puppet_modules="puppet/modules"

  
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
  end
  #$puppet_modules2="shared/$puppet_modules"
  #
  # Install wget module 
  # 
    config.vm.provision "shell", inline: <<-SHELL    
	    sudo apt-get update
		
		#sudo apt-get install python-software-properties -y
		#sudo apt-add-repository ppa:lestcape/cinnamon -y
		#sudo apt-get update
		#sudo apt-get install xinit
		#sudo apt-get install cinnamon -y
		#sudo apt-get install lightdm -y
		#sudo dpkg-reconfigure lightdm
		#sudo apt-get install virtualbox-guest-x11 -y
		#sudo apt-get install virtualbox-guest-additions-iso


		
		sudo puppet module install --force puppetlabs/stdlib
		sudo puppet module install --force maestrodev-wget
		#puppet module install jamesnetherton-google_chrome
		#puppet module install gini-idea
		
#		 sudo apt-get install -y xfce4
#sudo add-apt-repository -y ppa:lestcape/cinnamon
#sudo apt-get update
#sudo apt-get install -y cinnamon
		#sudo apt-get install libxss1 libappindicator1 libindicator7
		#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		#sudo dpkg -i google-chrome*.deb
		#sudo apt-get install -f
		#sudo dpkg -i google-chrome*.deb
#		sudo apt-get install -y xfce4
# sudo apt-get install -y xfce4
#sudo add-apt-repository -y ppa:lestcape/cinnamon
#sudo apt-get update
#sudo apt-get install cinnamon
	SHELL
	
  config.vm.provision :puppet do |puppet|

    puppet.manifests_path = "puppet/manifests"
	puppet.module_path = "puppet/modules"
    puppet.options = ['--verbose']
  end
  #config.vm.provision "file", source: "conf/sbt.sh", destination: "/home/vagrant/bin/sbt"
 
end