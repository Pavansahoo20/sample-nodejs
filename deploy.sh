#!/bin/bash

export PATH=$PATH:/usr/bin:/usr/local/bin
cd /home/ec2-user/sample-nodejs

echo "Fetching latest code..."
git fetch origin
git reset --hard origin/main

echo "Installing dependencies..."
npm install

echo "Killing app if already running..."
fuser -k 3000/tcp || true

echo "Starting app..."
npm start
