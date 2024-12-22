# Start the container in detached moded
sudo docker run -dit --gpus all -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v $(pwd)/workspace:/home/mil -w /home/mil --name mil-container mil-docker

# Add the SSH key to the container
echo "Adding SSH Key to the Container"
docker exec -u root mil-container mkdir -p "/home/mil/.ssh"
docker cp "./ssh_keys/id_rsa_mil" "mil-container:/home/mil/.ssh/id_rsa_mil"
docker cp "./ssh_keys/id_rsa_mil.pub" "mil-container:/home/mil/.ssh/id_rsa_mil.pub"

docker exec -u root mil-container bash -c "if [ ! -f /home/mil/.bashrc ]; then
  touch /home/mil/.bashrc
fi
echo '# Start SSH agent if it is not already running
if [ -z \"\$SSH_AUTH_SOCK\" ]; then
  eval \"\$(ssh-agent -s)\"
fi
# Add SSH key to the agent if not already added
ssh-add ~/.ssh/id_rsa_mil' >> /home/mil/.bashrc"


# Change the ownership of the home directory
docker exec -u root mil-container chown -R mil:mil /home/mil

# Switch to interative container
echo "Stopping the detached container"
docker stop mil-container

echo "Restarting without -d"
docker start -i mil-container
