#!/bin/bash

cordova=`which cordova`

echo "START: cordova iOS platform"
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
cordova platform add ios


cd ..
cd ..

echo "END: cordova iOS platform"
echo "*******************************************************************"