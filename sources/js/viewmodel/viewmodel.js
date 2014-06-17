/**
 * frontend knockoutjs-observed view models
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

function ViewModel() {
    // Properties

    this.geoLatitude = ko.observable();
    this.geoLongitude = ko.observable();

    this.viewState = {header: ko.observable(), content: ko.observable(), footer: ko.observable()}


}

ViewModel.prototype.setGeo = function (lon, lat) {

    this.geoLatitude(lat);
    this.geoLongitude(lon);
}

ViewModel.prototype.getDefinedRoutes = function () {
    return JSON.stringify(routing.routes);
}

ViewModel.prototype.swipeHandler = function ($data) {
    if (insidecordova) {
        navigator.notification.alert("you swiped me!", null, "swipe registered", "yeah, I know...");
    } else {
        alert("you swiped me!")
    }

}

ViewModel.prototype.doubleTapHandler = function ($data) {


    if (insidecordova) {
        navigator.notification.alert("you tapped me, twice!", null, "double tap registered", "yeah, I know...");
    } else {
        alert("you tapped me, twice!")
    }
}

ViewModel.prototype.holdHandler = function ($data) {


    if (insidecordova) {
        navigator.notification.alert("you held me!", null, "hold registered", "yeah, I know...");
    } else {
        alert("you held me!")
    }
}


