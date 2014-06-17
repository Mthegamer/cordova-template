#!/bin/bash

# part of the cordova template at https://github.com/sk3l3t0r/cordova-template
# author: android0x17@gmail.com
#
# Copyright 2014 android0x17
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


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

