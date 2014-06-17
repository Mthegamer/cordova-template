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


echo "START: complete clean rebuild of all platforms/plugins!"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

echo "projectname = $PROJECT_NAME, build-dir = $BUILD_DIR"

./1_clean_build_dir.sh
./2_cordova_project.sh
./3_cordova_platforms_android.sh
./4_cordova_plugins.sh
./5_sync_cordova_resources.sh
./6_sync_android_resources.sh
./7_sync_web_app.sh
./8_cordova_clean_android.sh
./9_cordova_build.sh
echo "END: complete clean rebuild of all platforms/plugins!"
echo "*******************************************************************"

