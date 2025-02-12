#!/bin/bash

apt update
apt upgrade -y
add-apt-repository ppa:ondrej/nginx -y
apt install nginx-full -y
mkdir -p /tmp/nginx
mkdir -p /var/www/html
chown -R www-data:www-data /tmp/nginx/
cp -rf /etc/nginx /etc/nginx.bak
cp -rf ./nginx /etc/nginx
openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/self-signed-key.pem -out /etc/nginx/ssl/self-signed-cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=LO/L=LOCAL/O=LOCALNET/OU=LOCAL/CN=localhost"
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

# additional nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 20
