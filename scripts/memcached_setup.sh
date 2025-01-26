#!/bin/bash

# Обновление пакетов и установка Memcached
sudo apt-get update
sudo apt-get install -y memcached libmemcached-tools

# Настройка Memcached для прослушивания на всех интерфейсах
sudo sed -i "s/-l 127.0.0.1/-l 0.0.0.0/" /etc/memcached.conf

# Перезапуск Memcached
sudo systemctl restart memcached
