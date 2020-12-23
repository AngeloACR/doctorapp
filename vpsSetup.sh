#!/bin/bash

#mongodb install
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt update
sudo apt install mongodb-org

#nginx install
#sudo apt install nginx

#node and npm install
sudo apt install nodejs
sudo apt install npm

#python install
sudo apt install python3-minimal
sudo apt install python

#git install
sudo apt install git

#nodemon install
sudo npm install nodemon -g

#pm2 install
sudo npm install pm2 -g

#mysql import
mysql -u root -p Docto < ./doctorappDB.sql

#screen install
sudo apt install screen

cd ./doctoNginx

chmod +x ./doctoNginx.sh
./doctoNginx.sh