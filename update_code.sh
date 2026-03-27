#!/bin/bash

DIR="/home/G02T04/e08g02t04-esmos-project"
REPO="https://github.com/Nigellzy/e08g02t04-esmos-project.git"

# 1. Check if the directory already exists
if [ -d "$DIR" ]; then
  echo "Directory found! Pulling latest code..."
  cd $DIR
  git pull
else
  echo "Directory not found! Cloning the repository for the first time..."
  git clone $REPO $DIR
  cd $DIR
fi

# 2. Rebuild and restart the Docker containers
sudo docker compose up -d --build