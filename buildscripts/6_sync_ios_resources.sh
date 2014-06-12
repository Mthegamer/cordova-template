#!/bin/bash

cordova=`which cordova`



#WWWDIR="$BUILDDIR/www"


WD=`pwd`

echo "START: sync iOS resources"
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

echo -e "\n************************************\npreparing ios resources"

IOSRES="$BUILD_DIR/$PROJECT_NAME"/platforms/ios/"$PROJECT_NAME"/Resources

if [ -d $IOSRES ]
then
    echo "removing ios resources from $IOSRES"
    rm "$IOSRES"/icons/*
    rm "$IOSRES"/splash/*
else
    echo "ERROR: something went wrong, ios resources dir ($IOSRES) does not exist!"
    exit 1
fi

echo "copying ios resources"
rsync -ah "$WD"/../cordova/ios/icon/* "$IOSRES"/icons
rsync -ah "$WD"/../cordova/ios/screen/* "$IOSRES"/splash


cd "$BUILDDIR"
echo "END: sync iOS resources"
echo "*******************************************************************"
