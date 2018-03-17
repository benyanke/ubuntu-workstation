FROM phusion/baseimage:latest
MAINTAINER Ben Yanke "ben@benyanke.com"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive

# Install user tools, x2go, and kde
RUN set -x \
      && add-apt-repository ppa:x2go/stable -y \
      && apt-get update -y \
      && apt-get install -y \
            sudo \
            nano \
            git \
            htop \
            vim \
            zip \
            unzip \
            curl \
            x2goserver \
            x2goserver-xsession \
            kubuntu-desktop \
            screen \
      && rm -rf /var/lib/apt/lists/*



# Enable SSH
RUN rm -f /etc/service/sshd/down ; /etc/my_init.d/00_regen_ssh_host_keys.sh

# Configure default user
RUN adduser --gecos "Ubuntu User" --disabled-password ubuntu && echo "ubuntu:ubuntu" | chpasswd && usermod -aG sudo ubuntu

# Setup hostname for terminal
echo "ubuntu-workstation" > /etc/hostname

# Clean up when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port 22 for SSH
EXPOSE 22
