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


echo "START: partial rebuild all platforms"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

echo "projectname = $PROJECT_NAME, build-dir = $BUILD_DIR"

./6_sync_android_resources.sh
./6_sync_ios_resources.sh
./7_sync_web_app.sh
./8_cordova_clean_android.sh
./8_cordova_clean_ios.sh
./9_cordova_build.sh
echo "END: partial rebuild all platforms"
echo "*******************************************************************"

