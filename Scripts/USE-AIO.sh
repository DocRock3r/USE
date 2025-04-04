#! /bin/bash

clear
echo "What do you want to do?"
echo "1. Install Docker"
echo "2. Install Docker + Portainer Server"
echo "3. Update system"
echo "4. Exit"
echo ""
echo -n "enter your selection: " 

while :
do

read choice

case $choice in 
1)  echo "Installing Docker..."
    # Add Docker's official GPG key:
    sudo apt-get update 1>/dev/null 
    sudo apt-get install ca-certificates curl -y 1>/dev/null 
    sudo install -m 0755 -d /etc/apt/keyrings 1>/dev/null 
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc 1>/dev/null 
    sudo chmod a+r /etc/apt/keyrings/docker.asc 1>/dev/null 
    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update 1>/dev/null 
    # Install Docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 1>/dev/null 
    echo "Done";;

2) echo "Installing Docker..."
    # Add Docker's official GPG key:
    sudo apt-get update 1>/dev/null 
    sudo apt-get install ca-certificates curl -y 1>/dev/null 
    sudo install -m 0755 -d /etc/apt/keyrings 1>/dev/null 
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc 1>/dev/null 
    sudo chmod a+r /etc/apt/keyrings/docker.asc 1>/dev/null 
    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update 1>/dev/null 
    # Install Docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 1>/dev/null
    echo "Done"
    #install Portianer server
    echo "Installing Portainer..."
    sudo docker volume create portainer_data 1>/dev/null
    sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts 1>/dev/null
    echo "Done" ;;

3)  echo "Updating Repository..."
    sudo apt-get update 1>/dev/null
    echo "Done"
    echo "Installing updates..."
    sudo apt-get upgrade -y 1>/dev/null
    echo "Done"
    echo "Cleaning up unused packages..."
    sudo apt-get autoremove -y 1>/dev/null
    echo "Done" ;;

4)  echo "Exiting..."
    exit ;;
*)  echo "Invalid option" ;;

esac

echo -n "enter your selection: " 

done