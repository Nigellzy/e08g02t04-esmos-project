#!/bin/bash
set -e 

DIR="/home/G02T04/e08g02t04-esmos-project"
REPO="https://github.com/Nigellzy/e08g02t04-esmos-project.git"

if [ -d "$DIR/.git" ]; then
  echo "Repo found. Updating..."
  cd $DIR
  git pull
else
  echo "Repo not found. Cloning..."
  sudo rm -rf $DIR || true
  git clone $REPO $DIR
  cd $DIR
fi

sudo docker compose up -d --build