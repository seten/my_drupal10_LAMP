#!/bin/bash

# Обновление пакетов и установка RabbitMQ
sudo apt-get update
sudo apt-get install -y rabbitmq-server

# Включение плагина управления RabbitMQ (опционально, для веб-интерфейса)
sudo rabbitmq-plugins enable rabbitmq_management

# Перезапуск RabbitMQ
sudo systemctl restart rabbitmq-server

# Создание пользователя и виртуального хоста для Drupal
sudo rabbitmqctl add_vhost drupal_vhost
sudo rabbitmqctl add_user drupaluser password
sudo rabbitmqctl set_user_tags drupaluser administrator
sudo rabbitmqctl set_permissions -p drupal_vhost drupaluser ".*" ".*" ".*"
