sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install docker
# https://docs.docker.com/engine/install/debian/#install-using-the-repository
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Install docker-compose
# https://docs.docker.com/compose/install/#install-compose-on-linux-systems
# https://github.com/duhio/docker-compose-usenet#installing-docker-compose
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# Maybe
sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose
