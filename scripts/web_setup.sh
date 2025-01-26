#!/bin/bash

# Обновление пакетов и установка Apache и PHP
sudo apt-get update
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql php-memcached php-amqplib unzip curl

# Настройка PHP памяти
sudo sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/*/apache2/php.ini

# Настройка виртуального хоста Apache для Drupal
sudo cat <<EOL > /etc/apache2/sites-available/drupal.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/drupal
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/drupal>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOL

# Активируем конфигурацию и модуль переписывания URL
sudo a2enmod rewrite
sudo a2ensite drupal.conf
sudo systemctl restart apache2

# Установка Drush (для управления Drupal)
sudo curl -OL https://github.com/drush-ops/drush/releases/download/10.6.2/drush.phar
sudo chmod +x drush.phar
sudo mv drush.phar /usr/local/bin/drush

# Скачивание Drupal 10.3.11 и установка
cd /tmp
curl -fSL https://ftp.drupal.org/files/projects/drupal-10.3.11.tar.gz -o drupal.tar.gz
tar -xzvf drupal.tar.gz
sudo mv drupal-10.3.11 /var/www/drupal

# Настройка прав доступа для Drupal
sudo chown -R www-data:www-data /var/www/drupal
sudo chmod -R 755 /var/www/drupal

# Установка завершена
echo "Apache и PHP настроены. Drupal 10.3.11 установлен в /var/www/drupal."
