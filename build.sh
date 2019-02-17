#!/bin/sh

BEDROCK_VERSION="1.9.0.15"
BEDROCK_DOWNLOAD_ZIP="https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_VERSION}.zip"
ZIPFILE=$(basename $BEDROCK_DOWNLOAD_ZIP)

if [ ! -f $ZIPFILE ]; then
   echo "Downloading file"
   curl --fail -O $BEDROCK_DOWNLOAD_ZIP
fi

if [ -f $ZIPFILE ]; then
   unzip -n -d bedrock_server $ZIPFILE
fi

if [ -d "bedrock_server" ]; then
   echo "Building image"
   docker build -t bedrock_server:${BEDROCK_VERSION} .
else
   echo "Server software not downloaded or unpacked!"
fi

rm -rf bedrock_server
