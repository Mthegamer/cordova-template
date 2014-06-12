#!/bin/bash

#part of the cordova template at https://github.com/sk3l3t0r/cordova-template
#author: android0x17@gmail.com


echo "START: partial rebuild all platforms: plugins, cordova & platform resources, webb app"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

echo "projectname = $PROJECT_NAME, build-dir = $BUILD_DIR"

./4_cordova_plugins.sh
./5_sync_cordova_resources.sh
./6_sync_android_resources.sh
./6_sync_ios_resources.sh
./7_sync_web_app.sh
./8_cordova_clean_android.sh.sh
./8_cordova_clean_ios.sh
./9_cordova_build.sh
echo "END: partial rebuild all platforms"
echo "*******************************************************************"


