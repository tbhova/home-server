apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y docker-compose

cd /vagrant_data/

docker-compose up -d
