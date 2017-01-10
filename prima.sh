#!/usr/bin/env bash

apt-get install -y git
apt-get install -y php5-common php5-cli php5-fpm
cd /usr/share/nginx/html/
sudo git clone https://github.com/miguel-mx/PRIMA.git
sudo chown -R vagrant PRIMA/
cd PRIMA
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
./composer.phar install
