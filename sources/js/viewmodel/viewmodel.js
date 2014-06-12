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



