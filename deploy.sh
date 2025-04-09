#!/bin/bash

# Add node/npm to path (optional but good practice)
export PATH=$PATH:/usr/bin:/usr/local/bin

cd /home/ec2-user/sample-nodejs

echo "Fetching latest code..."
git fetch origin
git reset --hard origin/main

echo "Installing dependencies..."
npm install

# No build step needed for this app

echo "Starting app (or set up pm2 here)..."
npm start
