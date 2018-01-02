$ curl -fsSL get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

sudo usermod -aG docker vgrant

echo "logout and login again becauser of docker group permission"
