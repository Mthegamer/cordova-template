#!/bin/bash

cordova=`which cordova`

BUILDDIR=../target/project

WWWDIR="$BUILDDIR/www"


WD=`pwd`

echo "START: sync iOS resources"
echo "*******************************************************************"


if [ -d "../target" ]
then
    echo ""
else
    echo "build directory does not exist! run cordovabuild first!"
    exit 1
fi

echo -e "\n************************************\npreparing ios resources"

IOSRES="$BUILDDIR"/platforms/ios/project/Resources

if [ -d $IOSRES ]
then
    echo "removing ios resources"
    rm "$IOSRES"/icons/*
    rm "$IOSRES"/splash/*
else
    echo "something went wrong, ios reources dir does not exist!"
    exit 1
fi

echo "copying ios resources"
rsync -ah ../cordova/ios/icon/* "$IOSRES"/icons
rsync -ah ../cordova/ios/screen/* "$IOSRES"/splash


cd "$BUILDDIR"
echo "END: sync iOS resources"
echo "*******************************************************************"
