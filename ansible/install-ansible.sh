# call with  permission
echo "call apt-add-repo"
echo -e "\n" | sudo apt-add-repository ppa:ansible/ansible
echo "call apt-get update"
sudo apt-get update
echo "after apt-get install software-properties-common"
sudo apt-get install software-properties-common
echo "after apt-get install ansible"
sudo apt-get install ansible
