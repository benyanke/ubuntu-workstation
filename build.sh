#!/bin/bash

# Build 16.04 container
# (
#   docker build --force-rm -f Dockerfile.16.04 -t benyanke/ubuntu-remote-desktop-base:16.04 .;
#  docker push benyanke/ubuntu-remote-desktop-base:16.04;
# ) &

# Build latest container
# (
#  docker build --force-rm -f Dockerfile.latest -t benyanke/ubuntu-remote-desktop-base:latest .;
#  docker push benyanke/ubuntu-remote-desktop-base:latest;
# ) &

# wait
echo "Build and push complete"
