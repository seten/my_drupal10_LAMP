Vagrant.configure("2") do |config|
  # Общие настройки для всех VM
  config.vm.box = "bento/ubuntu-22.04"

  # VM1: MariaDB
  config.vm.define "mariadb" do |mariadb|
    mariadb.vm.network "private_network", ip: "192.168.56.101"
    mariadb.vm.hostname = "mariadb.vm"
    mariadb.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    mariadb.vm.provision "shell", path: "scripts/mariadb_setup.sh"
  end

  # VM2: Memcached
  config.vm.define "memcached" do |memcached|
    memcached.vm.network "private_network", ip: "192.168.56.102"
    memcached.vm.hostname = "memcached.vm"
    memcached.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    memcached.vm.provision "shell", path: "scripts/memcached_setup.sh"
  end

  # VM3: RabbitMQ
  config.vm.define "rabbitmq" do |rabbitmq|
    rabbitmq.vm.network "private_network", ip: "192.168.56.103"
    rabbitmq.vm.hostname = "rabbitmq.vm"
    rabbitmq.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    rabbitmq.vm.provision "shell", path: "scripts/rabbitmq_setup.sh"
  end

  # VM4: Apache и PHP
  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "192.168.56.104"
    web.vm.hostname = "web.vm"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    web.vm.provision "shell", path: "scripts/web_setup.sh"
  end
end
