Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
    
    config.vm.define "db" do |db|
      db.vm.box = "bento/ubuntu-22.04"
      db.vm.hostname = "db"
      db.vm.network "private_network", ip: "192.168.56.10"
      #db.vm.provision "shell", path: "scripts/db.sh"
      db.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
      end
    end
  
    #config.vm.define "memcache" do |memcache|
    #  memcache.vm.box = "ubuntu/focal64"
    #  memcache.vm.hostname = "memcache"
    #  memcache.vm.network "private_network", ip: "192.168.56.11"
    #  memcache.vm.provision "shell", path: "scripts/memcache.sh"
    #  memcache.vm.provider "virtualbox" do |vb|
    #    vb.memory = 2048
    #    vb.cpus = 2
    #  end
    #end
  
    #config.vm.define "rabbitmq" do |rabbitmq|
    #  rabbitmq.vm.box = "ubuntu/focal64"
    #  rabbitmq.vm.hostname = "rabbitmq"
    #  rabbitmq.vm.network "private_network", ip: "192.168.56.12"
    #  rabbitmq.vm.provision "shell", path: "scripts/rabbitmq.sh"
    #  rabbitmq.vm.provider "virtualbox" do |vb|
    #    vb.memory = 2048
    #    vb.cpus = 2
    #  end
    #end
  
    config.vm.define "web" do |web|
      web.vm.box = "bento/ubuntu-22.04"
      web.vm.hostname = "web"
      web.vm.network "private_network", ip: "192.168.56.13"
      web.vm.provision "shell", path: "scripts/web.sh"
      web.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
      end
    end
  end

  