#!/bin/bash
set -e
sudo apt update && sudo apt upgrade -y

# Установка MariaDB
sudo apt-get update
sudo apt-get install -y mariadb-server

# Настройка MariaDB
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Создание базы данных и пользователя для Drupal
mysql -u root -e "CREATE DATABASE drupal;"
mysql -u root -e "CREATE USER 'drupal'@'%' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON drupal.* TO 'drupal'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Настройка конфигурации для внешнего подключения
sudo sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb
