# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Notes:
# Install guest additions: vagrant plugin install vagrant-vbguest
#
#
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-18.04"
#   centos.vm.box = "centos/7"
#   centos.vm.box = "centos/8"


  # VirtualBox Guest plugIn
  # https://github.com/dotless-de/vagrant-vbguest
  # Install guest addition: vagrant vbguest ubuntu --do install
  # Get guest adition status: vagrant vbguest ubuntu --status
  config.vbguest.auto_update = false
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # don't replace vagrant key
  config.ssh.insert_key = false


  # manage hosts file
  # https://github.com/devopsgroup-io/vagrant-hostmanager
  # Install hostmanager plugin: vagrant plugin install vagrant-hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = true
  config.hostmanager.include_offline = false

  # add this custom resolver to get the correct ip (and not 127.0.0.1)
  # https://github.com/devopsgroup-io/vagrant-hostmanager/issues/86
  # https://www.bountysource.com/issues/1473716-make-hostmanager-work-with-dhcp-addresses
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
      puts "==============================================================================================================="
      puts "#{`\"#{ENV['VBOX_MSI_INSTALL_PATH']}\\VBoxManage\" guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`}"
      puts "==============================================================================================================="
      puts "=============== VB ID: #{vm.id}"
  
      if vm.id && Vagrant::Util::Platform.windows?
          `\"#{ENV['VBOX_MSI_INSTALL_PATH']}\\VBoxManage\" guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
      else
          `VBoxManage guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
      end
  end

  # config.vm.define "opensuse" do |opensuse|
  # 	opensuse.vm.network "private_network", ip: "192.168.33.20"
  # 	opensuse.vm.box = "opensuse/openSUSE-42.3-x86_64"
  # 	opensuse.vm.hostname ="opensuse"
  # end
  #
  # config.vm.define "debian" do |debian|
  # 	debian.vm.network "private_network", ip: "192.168.33.21"
  # 	debian.vm.box = "debian/jessie64"
  	# debian.vm.hostname ="debian"
  # end

#   config.vm.define "ubuntu" do |ubuntu|
#   	ubuntu.vm.network "public_network", ip: "192.168.33.22"
#   	ubuntu.vm.hostname ="ubuntu"
#     config.vm.provider "virtualbox" do |vb_ubuntu|
#         vb_ubuntu.memory = "4096"
#     end
#   end


  # config.vm.define "centos" do |centos|
  # 	centos.vm.network "private_network", ip: "192.168.33.23"
  # 	centos.vm.box = "centos/7"
  # 	centos.vm.hostname ="centos"
  # end

  config.vm.define "master", primary: true do |master|
   	master.vm.network "public_network", ip: "192.168.33.10"
    master.vm.hostname ="master"
    config.vm.provider "virtualbox" do |vb_machine|
        vb_machine.memory = "4096"
    end
    # inject vagrant ssh key
    # https://devops.stackexchange.com/questions/1237/how-do-i-configure-ssh-keys-in-a-vagrant-multi-machine-setup
    master.vm.provision "file", source: "#{Dir.home}/.vagrant.d/insecure_private_key", destination: "/home/vagrant/.ssh/id_rsa"
    master.vm.provision "shell" do |s|
        s.inline = <<-SHELL
            chown vagrant /home/vagrant/.ssh/id_rsa
            chmod 400 /home/vagrant/.ssh/id_rsa
        SHELL
    end
  end
  
  (1..6).each do |i|
	config.vm.define "node-#{i}" do |node|
   		node.vm.hostname ="node-#{i}"
        node.vm.network "public_network", ip: "192.168.33.1#{i}"

        config.vm.provider "virtualbox" do |vb_machine|
            vb_machine.memory = "1024"
        end
 
        node.vm.provision "shell", inline: "echo hello from node #{i}"
   	end
  end


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.


  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
      vb.linked_clone = true
  #   # Customize the amount of memory on the VM:
      #vb.memory = "4096"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  #$script = <<-SCRIPT
  #    echo -e 'ubuntu\nubuntu' | sudo passwd ubuntu
  #SCRIPT

  # config.vm.provision "shell", inline: $script


end
