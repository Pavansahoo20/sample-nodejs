#!/bin/bash

export PATH=$PATH:/usr/bin:/usr/local/bin
cd /home/ec2-user/sample-nodejs

echo "Fetching latest code..."
git fetch origin
git reset --hard origin/main

echo "Installing dependencies..."
npm install

echo "Killing anything on port 3000..."
PID=$(lsof -ti tcp:3000)
if [ -n "$PID" ]; then
  echo "Force killing PID $PID"
  kill -9 $PID
  sleep 1
fi

echo "Starting app with PM2..."
pm2 delete node-app || true
pm2 start ./bin/www --name "node-app"
pm2 save
