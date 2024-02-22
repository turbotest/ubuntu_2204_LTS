Vagrant.configure("2") do |config|
  config.vm.box = "turbotest/ubuntu_2204_LTS_release_candidate"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.cpus   = 4
    virtualbox.memory = "5120"
  end

  config.vm.provision "shell", privileged: false, path: "./test/all.sh"
end