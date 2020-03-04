apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y docker-compose

cd /vagrant_data/

# Diabled for Docker Volumes - this would work if we created the files outside of the vagrant share where they can actually have 600 permissions.
# Set up Traefik files: https://stackoverflow.com/a/52524107
# touch letsencrypt/acme.json
# chmod 600 letsencrypt/acme.json

docker-compose up -d
