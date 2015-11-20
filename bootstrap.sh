#!/usr/bin/env bash

# Add key for docker apt repo
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Create docker apt source
if test -f /etc/apt/sources.list.d/docker.list;
	then truncate -s 0 /etc/apt/sources.list.d/docker.list;
else touch /etc/apt/sources.list.d/docker.list;
fi
printf "# Ubuntu Trusty 14.04 (LTS)\ndeb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

# Install packages
apt-get update
apt-get install -y linux-image-extra-$(uname -r)
apt-get install -y docker-engine
apt-get install -y git

# Start services
#service docker start
