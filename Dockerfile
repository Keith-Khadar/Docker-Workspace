# Use the official Ubuntu base image
FROM ubuntu:24.04

# Install common packages
RUN apt-get update && apt-get install -y \
    sudo \
    software-properties-common \
    build-essential \
    curl \
    wget \
    git \
    nano \
    unzip \
    tar \
    man \
    net-tools \
    iputils-ping \
    dnsutils \
    openssh-client \
    apt-transport-https \
    ca-certificates \
    python3 \
    python3-pip \
    htop \
    tree \
    lsb-release && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create the user 'mil' and set the home directory
RUN useradd -m -d /home/mil -s /bin/bash mil && \
    echo "mil:fuelsnob" | chpasswd && \
    usermod -aG sudo mil

# Switch to 'mil' user by default
USER mil

# Command to run when the container starts
CMD [ "bash" ]

