#!/bin/bash

cordova=`which cordova`

#WWWDIR="$BUILDDIR/www"

WD=`pwd`

echo "START: cordova config"
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

#
#
#if [ -d "$WWWDIR" ]
#then
#    echo ""
#
#else
#    mkdir "$WWWDIR"
#fi



echo -e "\n************************************\ncopying cordova config"
#cp cordova/config.xml "$WWWDIR"     #thats the wrong place
cp "$WD"/../cordova/config.xml "$BUILD_DIR/$PROJECT_NAME"

echo "END: cordova config"
echo "*******************************************************************"

