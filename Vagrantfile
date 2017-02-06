# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  # config.vm.provider "virtualbox" do |vb|
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  config.vm.provision "shell", path: "nginx.sh"
  config.vm.provision "shell", path: "prima.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8088
  config.vm.network "forwarded_port", guest: 443, host: 8443

  # $ ls -l /var/run/php5-fpm.sock
  # grep 'user' /etc/nginx/nginx.conf
  # nano -w /etc/php5/fpm/pool.d/www.conf
  # >>> listen.owner = www-data
  # >>> listen.group = www-data
  # <<< listen.owner = nginx
  # <<< listen.group = nginx
  # service php5-fpm restart
  # chown www-data /usr/share/nginx/html/PRIMA
end
