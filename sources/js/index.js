// author: android0x17@gmail.com

config = new Config();
i18n = new I18n();
viewModel = new ViewModel();
geoLocation = new GeoLocation();


project_env = "browser";
project_platform = "desktop";
useragent = navigator.userAgent.toLowerCase();
if (useragent.match(/android/)) {
    project_platform = 'android';
}
if (useragent.match(/iphone/)) {
    project_platform = 'iphone';
}
if (useragent.match(/ipad/)) {
    project_platform = 'ipad';
}

var insidecordova = ((document.URL.indexOf('http://') === -1) && (document.URL.indexOf('https://') === -1) && (document.URL.indexOf('file:///') === -1));


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
                }
                FastClick.attach(document.body);
            });
        }
    }
    ;


if (insidecordova) {
    project_env = 'cordova';
    console.log("running cordova app");
    app.initialize();
} else {
    project_env = 'browser';
    app.devready();
}


