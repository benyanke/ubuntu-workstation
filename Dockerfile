FROM phusion/baseimage:latest
MAINTAINER Ben Yanke "ben@benyanke.com"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


ENV DEBIAN_FRONTEND noninteractive

# Install user tools - feel free to add more here
RUN set -x \
      && apt-get update -y \
      && apt-get dist-upgrade -y \
      && apt-get install -y \
            sudo \
            nano \
            git \
            htop \
            vim \
            zip \
            unzip \
            curl \
      && rm -rf /var/lib/apt/lists/*

# Install X2Go server components
# RUN set -x \
#      && add-apt-repository ppa:x2go/stable \
#      && apt-get update -y \
#      && apt-get install -y x2goserver \
#      && rm -rf /var/lib/apt/lists/*

# SSH runtime
# RUN mkdir /var/run/sshd

# Configure default user
RUN adduser --gecos "Ubuntu User" --disabled-password ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd

# Add user to sudo group
RUN usermod -aG sudo ubuntu


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Expose port 22 for SSH
EXPOSE 22

