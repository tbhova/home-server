sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install docker
# https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# https://devdojo.com/tutorials/how-to-install-docker-and-docker-compose-on-raspberry-pi
sudo usermod -aG docker pi
sudo apt-get install -y libffi-dev libssl-dev python3 python3-pip
sudo pip3 install docker-compose

# https://www.zigbee2mqtt.io/information/docker.html
echo "SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"0451\", ATTRS{idProduct}==\"16a8\", SYMLINK+=\"cc2531\",  RUN+=\"/usr/local/bin/docker-setup-cc2531.sh\"" | sudo tee /etc/udev/rules.d/99-cc2531.rules
sudo udevadm control --reload-rules
sudo nano /usr/local/bin/docker-setup-cc2531.sh # copy contents with the single leading space on each line from the above link
sudo chmod 744 /usr/local/bin/docker-setup-cc2531.sh
sudo nano /usr/local/bin/docker-event-listener.sh
sudo chmod 744 /usr/local/bin/docker-event-listener.sh
sudo nano /etc/systemd/system/docker-event-listener.service
sudo chmod 744 /etc/systemd/system/docker-event-listener.service
sudo systemctl daemon-reload
sudo systemctl start docker-event-listener.service
sudo systemctl status docker-event-listener.service
sudo systemctl enable docker-event-listener.service

ls -al /dev/cc2531