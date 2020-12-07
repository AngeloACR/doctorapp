#!/bin/bash

sudo apt install curl gnupg2 ca-certificates lsb-release

echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \ | sudo tee /etc/apt/sources.list.d/nginx.list

echo "deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" \ | sudo tee /etc/apt/sources.list.d/nginx.list

curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

sudo apt-key fingerprint ABF5BD827BD9BF62

sudo apt update
sudo apt install nginx

cp ./deliveryApi.conf /etc/nginx/sites-enabled/deliveryApi.conf
cp ./doctorApi.conf /etc/nginx/sites-enabled/doctorApi.conf
cp ./usersApi.conf /etc/nginx/sites-enabled/usersApi.conf
cp ./tiendasApi.conf /etc/nginx/sites-enabled/tiendasApi.conf
cp ./generalApi.conf /etc/nginx/sites-enabled/generalApi.conf

cp ./proxy_params /etc/nginx/proxy_params

sudo service nginx reload