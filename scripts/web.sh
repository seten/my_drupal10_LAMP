#!/bin/bash
set -e
sudo apt update && sudo apt upgrade -y
apt-get install -y apache2 php libapache2-mod-php php-mysql php-memcached php-amqplib unzip wget

# Установка Composer
wget -O /tmp/composer-setup.php https://getcomposer.org/installer
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Установка Drupal
cd /var/www
composer create-project drupal/recommended-project drupal
chown -R www-data:www-data /var/www/drupal
chmod -R 755 /var/www/drupal

# Настройка Apache
cat <<EOL > /etc/apache2/sites-available/drupal.conf
<VirtualHost *:80>
    DocumentRoot /var/www/drupal/web
    <Directory /var/www/drupal/web>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOL

a2ensite drupal
a2enmod rewrite
systemctl restart apache2

# Настройка параметров Drupal
cd /var/www/drupal/web/sites/default
cp default.settings.php settings.php
chown www-data:www-data settings.php
chmod 644 settings.php

cat <<EOL >> settings.php

\$databases['default']['default'] = array (
  'driver' => 'mysql',
  'database' => 'drupal',
  'username' => 'drupal',
  'password' => 'drupalpass',
  'host' => '192.168.56.10',
  'port' => '3306',
  'prefix' => '',
);

\$settings['memcache']['servers'] = ['192.168.56.11:11211' => 'default'];
\$settings['memcache']['bins'] = ['default' => 'default'];
\$settings['memcache']['key_prefix'] = '';

\$settings['rabbitmq'] = [
  'host' => '192.168.56.12',
  'port' => 5672,
  'user' => 'guest',
  'password' => 'guest',
  'vhost' => '/',
];
EOL
