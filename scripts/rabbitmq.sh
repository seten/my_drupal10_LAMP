#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl gnupg
curl -fsSL https://packages.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo gpg --dearmor -o /usr/share/keyrings/rabbitmq-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/rabbitmq-archive-keyring.gpg] https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-erlang/deb/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/rabbitmq-erlang.list
echo "deb [signed-by=/usr/share/keyrings/rabbitmq-archive-keyring.gpg] https://dl.cloudsmith.io/public/rabbitmq/rabbitmq-server/deb/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/rabbitmq-server.list
sudo apt update
apt-get install -y rabbitmq-server
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
sudo systemctl status rabbitmq-server
sudo rabbitmqctl add_user drupal_user drupal_rabbitmq
sudo rabbitmqctl add_vhost drupal_vhost
sudo rabbitmqctl set_user_tags drupal_user administrator
sudo rabbitmqctl set_permissions -p drupal_vhost drupal_user ".*" ".*" ".*"
sudo rabbitmq-plugins enable rabbitmq_management
sudo ufw allow 5672  # Порт для приложений
sudo ufw allow 15672 # Порт для панели управления