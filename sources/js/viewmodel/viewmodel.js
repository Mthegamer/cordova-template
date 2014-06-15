/**
 * frontend knockoutjs-observed view models
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


