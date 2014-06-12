#!/bin/bash

cordova=`which cordova`


echo "START: creating cordova project"
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
    echo "cleaning build directory!"
#    read -p "Press [Enter] to continue"
    rm -rf $BUILD_DIR/*
else
    echo " creating... build directory"
#    read -p "Press [Enter] to continue"
    mkdir $BUILD_DIR
fi

cd $BUILD_DIR

WD=`pwd`

echo "current directory:" $WD


echo "creating cordova project"
#echo -e "\n cordova create " $PROJECT_NAME $PROJECT_PACKAGE $BUILD_DIR
cordova create $BUILD_DIR/$PROJECT_NAME   $PROJECT_PACKAGE  $PROJECT_NAME

if [ -d "$BUILD_DIR/$PROJECT_NAME" ]
then
    cd "$BUILD_DIR/$PROJECT_NAME"
else
    echo "CORDOVA PROJECT NOT CREATED! exiting..."
    exit 1
fi


cd ..
cd ..

echo "END: creating cordova project"
echo "*******************************************************************"
