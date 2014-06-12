#!/bin/bash

#part of the cordova template at https://github.com/sk3l3t0r/cordova-template
#author: android0x17@gmail.com


cordova=`which cordova`

#BUILDDIR=$BUILD_DIR/project

#WWWDIR="$BUILDDIR/www"


WD=`pwd`

echo "START: sync android resources"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

if [ -d "$BUILD_DIR" ]
then
    echo ""
else
    echo "build directory does not exist! run cordovabuild first!"
    exit 1
fi


echo -e "\n************************************\nsyncing android resources"

rsync -ah "$WD"/../cordova/android/icon/* "$BUILD_DIR/$PROJECT_NAME"/platforms/android/res/
echo "END: sync android resources"
echo "*******************************************************************"

