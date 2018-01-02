# jessie64
# Kernel: 3.16.0-4-amd64
# Storage driver: aufs
# Version:       17.12.0-ce
# API version:   1.35

# remove old versions
sudo apt-get remove docker docker-engine docker.io

sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# add SSL keys
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"


# Install docker-ce
sudo apt-get update
sudo apt-get install docker-ce
sudo usermod -aG docker vagrant

# Test
sudo docker run hello-world
