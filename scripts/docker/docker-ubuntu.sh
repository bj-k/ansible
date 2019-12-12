# xenial64
# Kernel: 4.4.0-104-generic
# Storage driver: overlay2
# Version: 17.12.0-ce
# API version: 1.35


# remove old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install docker-ce
sudo apt-get update && sudo apt-get install docker-ce

# Install specific version
# apt-cache madison docker-ce
# sudo apt-get install docker-ce=18.06.0~ce~3-0~ubuntu

sudo usermod -aG docker vagrant

# Test
sudo docker run hello-world
