// this is heavily insired by Greg Wilson's getAccurateCurrentPosition, see https://github.com/gwilson/getAccurateCurrentPosition
/*
 * part of the cordova template at https://github.com/sk3l3t0r/cordova-template
 * author: android0x17@gmail.com
 *
 * Copyright 2014 android0x17
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */
function GeoLocation() {

    var watchID = null;
    var geoID = null;
    var geoLocationFixed = false;

    var lastCheckedPosition;
    var locationEventCount = 0;
    var timerID;

    /*
     configure here!
     */
    var options = {
        maxWait: 20000, //in millisecs
        desiredAccuracy: 20, //in meters
        timeout: 20000, //in millisecs, usually same as maxWait
        maximumAge: 300000, // use 0 for current locations only,
        enableHighAccuracy: true //  high accuracy
    };


    if (!navigator.geolocation) {
        var msg = "your browser and / or OS do not support geo location, app will not work!"
        if (insidecordova) {
            var msg = "your device does not support geo location, app will not work!"
            navigator.notification.alert(msg, function () {
                app.exitApp()
            }, "geo location error", "exit")
        } else {
            alert.log(msg);
        }
    }

    this.startWatchingGeo = function () {
        if (config.debugMode)
            console.log("geo: starting up...");
        geoLocation.locateMe();
        geoID = window.setInterval(geoLocation.locateMe, config.gpsUpdateInterval);
    }

    this.stopWatchingGeo = function () {
        if (geoID != null) {
            window.clearInterval(geoID);
            geoID = null;
        }
    }

    this.locateMe = function () {
        locationEventCount = 0;
        if (watchID == null) {
            if (config.debugMode)
                console.log("geo: searching position");
//            geoLocation.useLastPosition();
            geoLocation.stillInProgress = true;
            geoLocation.getPrecise();
        }
    }


    this.geoSuccess = function (position) {

        geoLocationFixed = true;
        geoLocation.updateClient({longitude: position.coords.longitude, latitude: position.coords.latitude});
        if (config.debugMode)
        console.log('geo: accurate position found');
    }


    this.updateClient = function (position) {
//        utils.message("position updated");
        if(config.debugMode)
        console.log("position updated");

        viewModel.setGeo(position.longitude, position.latitude);


    }

    this.geoProgress = function (position) {

        geoLocation.updateClient({longitude: position.coords.longitude, latitude: position.coords.latitude});
        if (config.debugMode)
        console.log('geo: coarse position found');
    }


    this.geoError = function (msg) {


        if (msg.code == 1) {//PositionError.PERMISSION_DENIED) {
            notification.addNotification("GPS deactivated!", "please turn on GPS localization or enable GPS for app. Currently app is not allowed to use GPS.");
            return;
        }

        if (msg.code == 2) {//PositionError.POSITION_UNAVAILABLE) {
            console.log("geo: error: position unavailable");
        }

        if (msg.code == 3) {// PositionError.TIMEOUT) {
        }
        console.log("geo: error: timeout");
    }

//    this.useLastPosition = function () {
//        if (config.debugMode)
//        console.log('geo: using last stored position.');
//    }


    this.checkAccuracy = function (position) {
        lastCheckedPosition = position;
        locationEventCount += 1;
        // ignore first event unless it's the only one received:
        // some devices send a cached location even when maximumAge is set to zero
        if ((position.coords.accuracy <= options.desiredAccuracy) && (locationEventCount > 1)) {
            clearTimeout(timerID);
            navigator.geolocation.clearWatch(watchID);
            watchID = null;
            geoLocation.foundPosition(position);
        } else {
            geoLocation.geoProgress(position);
        }
    };

    this.giveUp = function () {
        navigator.geolocation.clearWatch(watchID);
        watchID = null;
        if (lastCheckedPosition) {
            geoLocation.foundPosition(lastCheckedPosition);
        } else {
            console.log("giving up without finding accurate position...");
        }
    };

    this.error = function (error) {
        clearTimeout(timerID);
        navigator.geolocation.clearWatch(watchID);
        watchID = null;
        geoLocation.geoError(error);
    };

    this.foundPosition = function (position) {
        geoLocation.geoSuccess(position);

    };


    this.getPrecise = function () {
        watchID = navigator.geolocation.watchPosition(geoLocation.checkAccuracy, geoLocation.error, options);

        timerID = setTimeout(geoLocation.giveUp, options.maxWait);
    }

}