#!/bin/sh

#!/bin/bash

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
declare -a arr=("org.apache.cordova.dialogs" "org.apache.cordova.geolocation" "org.apache.cordova.device" "org.apache.cordova.camera" "org.apache.cordova.network-information" "org.apache.cordova.inappbrowser" "de.appplant.cordova.plugin.local-notification")

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

