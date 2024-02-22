Vagrant.configure("2") do |config|
  config.vm.box = "local/ubuntu_2204_LTS"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.cpus   = 4
    virtualbox.memory = "5120"
    virtualbox.name   = "turbotest"
  end

  config.vm.provision "shell", privileged: false, path: "./test/all.sh"
end