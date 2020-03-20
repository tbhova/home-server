cd /vagrant_data/

# This is needed because after a single up, Traefik only sees Docker services.
# However, after the subsequent up, Traefik also sees file provider services.
docker-compose up -d
docker-compose down
docker-compose up -d

echo "Docker Started"