#!/bin/bash
cd /home/ec2-user/sample-nodejs
git pull origin main
npm install &&
npm run build &&
pm2 restart index.js