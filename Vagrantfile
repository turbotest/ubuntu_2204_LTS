Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.cpus   = 4
    virtualbox.memory = "5120"
    virtualbox.name   = "turbotest"
  end

  config.vm.provision "shell", privileged: false, path: "./install/base_dependencies.sh"
  config.vm.provision "shell", privileged: false, path: "./install/user_account.sh"
  config.vm.provision "shell", privileged: false, path: "./install/elasticsearch.sh"
  config.vm.provision "shell", privileged: false, path: "./install/javascript_node.sh"
  config.vm.provision "shell", privileged: false, path: "./install/headless_browsers.sh"
  config.vm.provision "shell", privileged: false, path: "./install/mysql.sh"
  config.vm.provision "shell", privileged: false, path: "./install/mariadb.sh"
  config.vm.provision "shell", privileged: false, path: "./install/memcached.sh"
  config.vm.provision "shell", privileged: false, path: "./install/openssl.sh"
  config.vm.provision "shell", privileged: false, path: "./install/postgresql.sh"
  config.vm.provision "shell", privileged: false, path: "./install/rabbitmq.sh"
  config.vm.provision "shell", privileged: false, path: "./install/redis.sh"
  config.vm.provision "shell", privileged: false, path: "./install/ruby.sh"
end