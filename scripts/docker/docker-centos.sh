# centos 7
# Kernel: 3.10.0-693.5.2.el7.x86_64
# Storage driver: overlay2
# Version: 17.12.0-ce
# API version: 1.35


sudo yum remove docker \
                  docker-common \
                  docker-selinux \
                  docker-engine


sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# disable edge repo
sudo yum-config-manager --disable docker-ce-edge



# install docker-ce
sudo yum install docker-ce
sudo systemctl start docker

sudo usermod -aG docker vagrant
