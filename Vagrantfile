# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  #config.vm.box = "napramirez/kubuntu-14.04.2-LTS-amd64-lite"
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box = "ubuntu/vivid64"
  #config.vm.box_version = " 20160127.0.0"
  config.vm.network "private_network", ip: "55.55.55.102"
  config.vm.synced_folder ".", "/home/vagrant/shared/"
  #config.vm.synced_folder "./remote/puppet", "/etc/puppet/"
  $puppet_modules="puppet/modules"

  
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
	v.memory = 2048
  end
  #$puppet_modules2="shared/$puppet_modules"
  #
  # Install wget module 
  # 
    config.vm.provision "shell", inline: <<-SHELL    
	    sudo apt-get update
		
		sudo apt-get install python-software-properties -y
		#sudo apt-add-repository ppa:lestcape/cinnamon -y
		#sudo apt-get update
		#sudo apt-get install xinit -y
		#sudo apt-get install cinnamon -y
		#sudo apt-get install lightdm -y
		#sudo dpkg-reconfigure lightdm
		#sudo apt-get install virtualbox-guest-x11 -y
		#sudo apt-get install virtualbox-guest-additions-iso
		#sudo mount /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
		#cd /mnt
		#sudo ./VBoxLinuxAdditions.run
		
		#sudo add-apt-repository ppa:kubuntu-ppa/backports -y
		#sudo add-apt-repository ppa:kubuntu-ppa/ppa -y
		#sudo apt-get update 
		#sudo apt-get dist-upgrade
		#sudo apt-get install kde-standard kubuntu-desktop
		# sudo apt-get install kubuntu-desktop -y
		
		sudo apt-get install xinit -y
		sudo aptitude -y install kde-workspace gnome-panel 


		sudo apt-get install puppet -y
		sudo puppet module install --force puppetlabs/stdlib
		sudo puppet module install --force maestrodev-wget
		#puppet module install jamesnetherton-google_chrome
		puppet module install --force gini-idea
		
		 #sudo apt-get install -y xfce4

		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
		sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
		sudo apt-get update 
		sudo apt-get install google-chrome-stable
	
		sudo apt-get install firefox
	SHELL
	

  config.vm.provision :puppet do |puppet|

    puppet.manifests_path = "puppet/manifests"
	puppet.module_path = "puppet/modules"
    puppet.options = ['--verbose']
	    
	puppet.facter = {}
    # Take any FACTER_ prefixed environment variable and set it as a fact for
    # vagrant to give to puppet during provisioning.
    ENV.each do |key, value|
      next unless key =~ /^FACTER_/
      puppet.facter[key.gsub(/^FACTER_/, "")] = value
    end
  end
  
  #config.vm.provision "file", source: "conf/sbt.sh", destination: "/home/vagrant/bin/sbt"
 
end