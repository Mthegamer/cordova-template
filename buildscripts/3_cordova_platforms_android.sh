#!/bin/bash

#part of the cordova template at https://github.com/sk3l3t0r/cordova-template
#author: android0x17@gmail.com


cordova=`which cordova`

echo "START: cordova ANDROID platform"
echo "*******************************************************************"
CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

cd "$BUILD_DIR/$PROJECT_NAME"



echo "installing cordova platforms"
#read -p "Press [Enter] to continue"
cordova platform add android


cd ..
cd ..
echo "END: cordova ANDROID platform"
echo "*******************************************************************"
