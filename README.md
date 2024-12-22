# Docker Workspace
This is a workspace dedicated to creating a containerized environment for running Ubuntu 24.04.

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
