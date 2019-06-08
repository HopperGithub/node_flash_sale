#!/bin/bash
SOURCE_PATH="."
DEST_PATH="dist"
start=$(date +%s)

set -e

reset="\e[0m"
red="\e[0;31m"
green="\e[0;32m"
cyan="\e[0;36m"
white="\e[0;37m"

echo "install deps"
npm run install_dep

echo "build source"
cd client
npm run build
cd ../server
npm run build
cd ..

rm -rf ${DEST_PATH}

mkdir -p ${DEST_PATH}
mkdir -p ${DEST_PATH}/client/
mkdir -p ${DEST_PATH}/server/
cp -R -f ${SOURCE_PATH}/client/dist/client/* ${DEST_PATH}/client/
cp -R -f ${SOURCE_PATH}/server/* ${DEST_PATH}/server/
mv ${DEST_PATH}/server/ ${DEST_PATH}/flash_sale_client
mv ${DEST_PATH}/client/ ${DEST_PATH}/flash_sale_server
cd ${DEST_PATH}
tar -czvf flash_sale_client.tar.gz flash_sale_client/
tar -czvf flash_sale_server.tar.gz flash_sale_server/

end=$(date +%s)
time=$(( $end - $start ))

echo "build in ($time) 秒"
