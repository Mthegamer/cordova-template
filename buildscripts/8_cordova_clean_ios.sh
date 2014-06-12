#!/bin/bash

cordova=`which cordova`



echo "START: cordova clean ios"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

cd "$BUILD_DIR/$PROJECT_NAME"

echo "cleaning cordova build ios"
./platforms/ios/cordova/clean


echo "END: cordova clean ios"
echo "*******************************************************************"
