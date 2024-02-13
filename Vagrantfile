Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = "5120"
  end

  config.vm.provision "shell", privileged: false, path: "base_dependencies.sh"
  config.vm.provision "shell", privileged: false, path: "user_account.sh"
  config.vm.provision "shell", privileged: false, path: "elasticsearch.sh"
  config.vm.provision "shell", privileged: false, path: "headless_browsers.sh"
  config.vm.provision "shell", privileged: false, path: "javascript_node.sh"
  config.vm.provision "shell", privileged: false, path: "mariadb.sh"
  config.vm.provision "shell", privileged: false, path: "memcached.sh"
  config.vm.provision "shell", privileged: false, path: "mysql.sh"
  config.vm.provision "shell", privileged: false, path: "postgresql.sh"
  config.vm.provision "shell", privileged: false, path: "rabbitmq.sh"
  config.vm.provision "shell", privileged: false, path: "redis.sh"
  config.vm.provision "shell", privileged: false, path: "ruby.sh"
end