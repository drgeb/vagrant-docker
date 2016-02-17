# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# Disable synced folders for the Docker container
# (prevents an NFS error on "vagrant up")
#  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "mysshd" do |v|
     config.ssh.insert_key = true
     # Configure the Docker provider for Vagrant
     v.vm.provider "docker" do |d|
        d.vagrant_vagrantfile = "./myboot2docker/Vagrantfile"
        d.has_ssh = true
        d.build_dir = "./mysshd"
	d.remains_running = true
     end
#    if you do not specify the user the default user vagrant is used.
#    as result you can't properly login and you must override this by specifying the -l <user> 
#    property of the of the ssh login command
#    so for vagrant command looks like
#    vagrant ssh <id client> -- -l <username that has ssh access>
     v.ssh.username = "root"
#     v.ssh.private_key_path = "keys/boot2docker_docker_id_rsa.pub"
#     v.vm.synced_folder "./keys", "/keys"
#     v.vm.synced_folder "./mysshd/keys", "/mysshd/keys"  
     v.vm.provision "shell", inline: "echo Hello I AM DONE"
  end

  config.vm.define "archiva" do |v|
     config.ssh.insert_key = true
     # Configure the Docker provider for Vagrant
     v.vm.provider "docker" do |d|
        d.vagrant_vagrantfile = "./myboot2docker/Vagrantfile"
        d.has_ssh = true
        d.build_dir = "./archiva"
	d.remains_running = true
     end
  end
end