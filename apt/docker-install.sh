echo "Welcome to Docker and Docker Compose setup script!"
echo "Removing old docker installation if exists"
sudo apt-get purge docker*

# use -P ~/SomeDir for download to specific directory
echo "Downloading docker..."
wget -qO- https://get.docker.com/ | sh

echo "PIP: Installing or upgrading..."
sudo apt-get -y install python-pip
sudo pip install --upgrade pip

echo "PIP: Installing supertools..."
sudo pip install setuptools

echo "PIP: Installing docker-compose..."
sudo pip install docker-compose

