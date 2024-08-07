#!/bin/bash -xe

sudo export DEBIAN_FRONTEND=noninteractive

# Verify the Nginx Package Repository Sign Key.
sudo curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

# Verify the NodeJS Package Repository Sign Key.
sudo curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Initialize the Nginx Package Repository
sudo echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list

#Initialze the NodeKS Package Repository
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Initialize the PHP & NodeJS Package Repository
sudo apt-get update && sudo apt-get install -y apt-utils wget curl nano zip unzip git openssl sqlite3 build-essential software-properties-common cron supervisor gnupg tzdata language-pack-en-base && \
     export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8 && \
     sudo apt-get install -y software-properties-common && \
     sudo add-apt-repository -y ppa:ondrej/php && \
     sudo apt-get update

# Install NodeJS
sudo apt-get -y install nodejs && npm install -g npm && npm install -g yarn

# Install Nginx, PHP
sudo apt-get -y install nginx \
       php8.2-fpm php8.2-cli php8.2-curl php8.2-mbstring \
       php8.2-mysql php8.2-pgsql php8.2-gd php8.2-bcmath php8.2-readline \
       php8.2-zip php8.2-imap php8.2-xml php8.2-intl php8.2-soap \
       php8.2-memcached php8.2-xdebug php8.2-redis php8.2-sqlite

# Install Composer (PHP Package Dependency Manager)
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && sudo php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && sudo php composer-setup.php --install-dir=/usr/bin --filename=composer \
  && sudo php -r "unlink('composer-setup.php');"

sudo service php8.2-fpm start

sudo service nginx start

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_SUSPEND=1 apt-get -y upgrade

sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_SUSPEND=1 apt-get -y install ruby-full

sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_SUSPEND=1 apt-get -y dist-upgrade

cd /home/ubuntu && wget https://aws-codedeploy-$1.s3.$1.amazonaws.com/latest/install

sudo chmod +x ./install && sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_SUSPEND=1 ./install auto

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli
rm -rf aws awscliv2.zip
