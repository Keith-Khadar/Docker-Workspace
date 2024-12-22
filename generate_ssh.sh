# Check if /ssh_keys directory exists
if test -d ./ssh_keys; then
	# Check if there is an existing SSH key specific to the entered username
	if test -f ./ssh_keys/id_rsa_mil.pub; then
		echo "SSH key already exists."
	else
		echo "No SSH key. Generating one."
		read -p "Please enter your email: " email
		ssh-keygen -t rsa -b 4096 -C "$email" -f ./ssh_keys/id_rsa_mil 
		echo "Key generated successfully"
		echo "Key located at ./ssh_keys. Please add it to your github."
		cat ./ssh_keys/id_rsa_mil.pub 
	fi
fi
