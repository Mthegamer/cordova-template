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

echo "START: cordova PLUGINS"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

cd "$BUILD_DIR/$PROJECT_NAME"


INSTALLED_PLUGINS=`cordova plugins ls`


## declare all plugins that you need, see http://plugins.cordova.io
#declare -a arr=("org.apache.cordova.dialogs" "org.apache.cordova.geolocation" "org.apache.cordova.device" "org.apache.cordova.camera" "org.apache.cordova.network-information" "org.apache.cordova.inappbrowser" "de.appplant.cordova.plugin.local-notification")
declare -a arr=("org.apache.cordova.dialogs" "org.apache.cordova.geolocation" "org.apache.cordova.device" "org.apache.cordova.camera" "org.apache.cordova.network-information")

## now loop through the above array
for i in ${arr[@]}
do
   if [[ $INSTALLED_PLUGINS == *$i* ]]
   then
        echo "plugin already installed:" $i
   else
        cordova plugin add $i
   fi

done

echo "END: cordova PLUGINS"
echo "*******************************************************************"

