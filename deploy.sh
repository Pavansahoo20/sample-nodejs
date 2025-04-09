#!/bin/bash

export PATH=$PATH:/usr/bin:/usr/local/bin
cd /home/ec2-user/sample-nodejs

echo "Fetching latest code..."
git fetch origin
git reset --hard origin/main

echo "Installing dependencies..."
npm install

echo "Killing app if already running..."
PORT=3000
PID=$(lsof -ti tcp:$PORT)
if [ -n "$PID" ]; then
  echo "Killing process on port $PORT (PID: $PID)"
  kill -9 $PID
fi


echo "Starting app..."
npm start
