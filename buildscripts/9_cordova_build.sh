#!/bin/bash

cordova=`which cordova`



echo "START: cordova build for installed platforms"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

cd "$BUILD_DIR/$PROJECT_NAME"

echo "building cordova"
cordova build

echo "END: cordova build for installed platforms"
echo "*******************************************************************"
