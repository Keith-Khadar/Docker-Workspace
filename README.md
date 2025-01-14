# Docker Workspace
This is a workspace dedicated to creating a containerized environment for running Ubuntu 24.04.

# Install Docker
## Add Docker's official GPG key:
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

## Add the repository to Apt sources:
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Add docker to the sudo group so you can run docker without sudo
```bash
sudo groupadd docker
```
```bash
sudo usermod -aG docker $USER
```

## To reload the permissions without restarting
```bash
newgrp docker
```

## To Create the image
```bash
./make_image.ssh
```

## To build the image
### Generate your ssh keys and add them to github
```bash
./generate_ssh.sh
```
### Create the container
```bash
./create.sh
```
This creates the container and mounts the home directory in the workspace folder.

## Extra Utilities
```bash
./start.sh
```
This lets you start up a container. Think of this as booting up a container like if you were to boot up a computer.

```bash
./close.sh
``` 
If you need to stop the docker container for some reason, i.e. and improper exit.

```bash
./remove.sh
```
If you want to completely delete the workspace. Make sure the container is closed. You will need to run create after this.
