/**
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

config = new Config();
i18n = new I18n();
viewModel = new ViewModel();
geoLocation = new GeoLocation();


project_env = "browser";
project_platform = "desktop";
useragent = navigator.userAgent.toLowerCase();
if (useragent.match(/android/)) {
    project_platform = 'android';
    console.log("window._cordovaNative:" + window._cordovaNative);
}
if (useragent.match(/iphone/)) {
    project_platform = 'iphone';


}
if (useragent.match(/ipad/)) {
    project_platform = 'ipad';
    console.log("window._nativeReady:" + window._nativeReady);
}

var insidecordova = true;
if (typeof fakeCordovaJS != 'undefined')
    insidecordova = false;

var app = {

        // Application Constructor
        initialize: function () {
            console.log("initializing app");
            this.bindEvents();
        },
        // Bind Event Listeners
        //
        // Bind any events that are required on startup. Common events are:
        // 'load', 'deviceready', 'offline', and 'online'.
        bindEvents: function () {
            console.log("binding container events");
            document.addEventListener('deviceready', app.onDeviceReady, false);

        },
        // deviceready Event Handler
        //
        // The scope of 'this' is the event. In order to call the 'receivedEvent'
        // function, we must explicity call 'app.receivedEvent(...);'
        onDeviceReady: function () {
            console.log("onDeviceReady");
            insidecordova = true;
            app.devready();
            document.addEventListener('resume', app.resume, false);
            document.addEventListener('pause', app.pause, false);
            document.addEventListener('backbutton', app.backbutton, false);
        },

        resume: function () {
            app.devready();
        },

        pause: function () {
            routing.stopNetworkUpdates();
            geoLocation.stopWatchingGeo();
        },

        exitApp: function () {
            geoLocation.stopWatchingGeo();
            navigator.app.exitApp();
        },


        exitFromApp: function () {
            navigator.notification.confirm(
                'Do you really want to exit?', // message
                function (index) {
                    console.log('button was pressed:' + index);
                    if (index == '2') {
                        console.log("exiting app, bye...");
                        app.exitApp();
                    } else {
                        console.log("cancel was selected");
                    }
                }, // callback to invoke with index of button pressed
                'do you want to close app?', // title
                ['Cancel', 'OK'] // buttonLabels
            );

        },

        backbutton: function () {
            if (routing.viewStateHistory.length > 0) {
                routing.navigateBack();
            } else {
                app.exitFromApp();
            }

        },

        devready: function () {
            console.log('devready: project running on ' + project_env + ' / ' + project_platform);

            if (viewModel == null || typeof viewModel === 'undefined') {
                viewModel = new ViewModel();
            }

            $(document).ready(function () {


                geoLocation.startWatchingGeo(10000);
                console.log("Finished initializing.");

                ko.applyBindings(viewModel, document.getElementById('knockmeout'));
                routing.raise_errors = true;
                if (!routing.isRunning()) {
                    routing.run();
                }
                routing.navigateTo("#/")
                if (insidecordova) {
                    FastClick.attach(document.body);
                }

            });
        }
    }
    ;

//console.log("window._nativeReady:"+window._nativeReady);
//console.log("window._cordovaNative:"+window._cordovaNative);
if (insidecordova) {
    project_env = 'cordova';
    console.log("running cordova app");
    app.initialize();
} else {
    project_env = 'browser';
    app.devready();
}


