#!/bin/bash

cordova=`which cordova`

BUILDDIR=../target/project

WWWDIR="$BUILDDIR/www"


WD=`pwd`

echo "START: sync android resources"
echo "*******************************************************************"


if [ -d "../target" ]
then
    echo ""
else
    echo "build directory does not exist! run cordovabuild first!"
    exit 1
fi


echo -e "\n************************************\nsyncing android resources"

rsync -ah ../cordova/android/icon/* "$BUILDDIR"/platforms/android/res/
echo "END: sync android resources"
echo "*******************************************************************"

