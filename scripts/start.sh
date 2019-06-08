#!/bin/bash

kill -9 $(lsof -i:3003 |awk '{print $2}' | tail -n 2) &
kill -9 $(ps | grep nodemon |awk '{print $1}') &

cd server
npm start &

cd ../client
npm start
