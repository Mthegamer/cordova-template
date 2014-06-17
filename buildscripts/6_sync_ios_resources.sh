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
