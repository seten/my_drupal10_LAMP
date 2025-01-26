#!/bin/bash

# Обновление пакетов и установка MariaDB
sudo apt-get update
sudo apt-get install -y mariadb-server

# Настройка привязки к IP-адресу
sudo sed -i "s/bind-address.*/bind-address = 192.168.56.101/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Перезапуск MariaDB
sudo systemctl restart mariadb

# Создание базы данных и пользователя для Drupal
sudo mysql -e "CREATE DATABASE drupal;"
sudo mysql -e "CREATE USER 'drupaluser'@'%' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON drupal.* TO 'drupaluser'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"
