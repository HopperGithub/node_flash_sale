#!/bin/bash

cd client
rm -rf node_modules
npm install &

cd ../server
rm -rf node_modules
# npm install
npm i --registry=https://registry.npm.taobao.org