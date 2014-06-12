#!/bin/bash
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

