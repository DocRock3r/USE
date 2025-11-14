#! /bin/bash

echo "Installing Docker..."
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

    #install Portianer agent
    echo "Installing Portainer agent..."
    sudo docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes -v /:/host portainer/agent:lts 1>/dev/null
    echo "Done" ;;