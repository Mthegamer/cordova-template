/**
 * frontend knockoutjs-observed view models
 */

function ViewModel() {
    // Properties

    this.geoLatitude = ko.observable();
    this.geoLongitude = ko.observable();

    this.viewState = {header: "", content: "", mainview: ""}


}

ViewModel.prototype.setGeo = function (lon, lat) {

    this.geoLatitude(lat);
    this.geoLongitude(lon);
}



