var utils = {
    _defaultToastLength: 4000, // ms

    /**
     * HTML5 Geolocation function.
     * @param   {function} [onSuccess = _geolocate_success] - callback on success
     * @param   {function} [onError = _geolocate_error]     - callback on error
     *
     * @return  undefined
     */
    geolocate: function(onSuccess, onError) {
        this.loaderOverlay();
        var success = typeof onSuccess === "function" ? onSuccess : utils._geolocate_success;
        var error = typeof onError === "function" ? onError : utils._geolocate_error;
        if ('geolocation' in navigator) {
            navigator.geolocation.getCurrentPosition(function(results) {
                utils.loaderOverlayDone();
                success(results);
            }, function(err) {
                utils.loaderOverlayDone();
                error(err);
            });
        } else {
            toast("Your browser doesn't support geolocation. Update to a modern browser or use the location finder.", utils._defaultToastLength)
            utils.loaderOverlayDone();
        }
    },

    /**
     * @name    _geolocate_success
     *
     * @param   {Geoposition} position               - position object from geolocation
     * @param   {number} position.coords.latitude    - latitude
     * @param   {number} position.coords.longitude   - longitude
     *
     * @return  undefined
     */
    _geolocate_success: function(position) {
        // TODO: actually implement default behaviour
        document.getElementById("location").innerHTML = position.coords.latitude + ", " + position.coords.longitude;
        console.log({latitude: position.coords.latitude, longitude: position.coords.longitude});
        utils.loaderOverlayDone();
    },

    /**
     * @name    _geolocate_error
     *
     * @param   {PositionError} error           - error from geolocation
     * @param   {string}        error.message   - error message string
     * @param   {number}        error.code      - error code
     *          1: PERMISSION_DENIED  2: POSITION_UNAVAILABLE  3: TIMEOUT
     *
     * @return  undefined
     */
    _geolocate_error: function(error) {
        var message = error.message === "" ? "" : ", " + error.message;
        toast("Whoa! There was an error getting your location. Check your permissions and try again. (Error " + error.code + message + ")", utils._defaultToastLength);
        utils.loaderOverlayDone();
    },

    /**
     * @param   {string} address                            - User entered address/location
     * @param   {function} [onSuccess = _geocode_success]   - callback on success
     * @param   {function} [onError = _geocode_error]       - callback on error
     *
     * @return  undefined
     */
    geocode: function(address, onSuccess, onError) {
        this.loaderOverlay();
        var success = typeof onSuccess === "function" ? onSuccess : utils._geocode_success;
        var error = typeof onError === "function" ? onError : utils._geocode_error;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                utils.loaderOverlayDone();
                success(results);
            } else {
                utils.loaderOverlayDone();
                error(status);
            }
        });
    },

    /**
     * @name    _geocode_success
     *
     * @param   {GeocoderResults} results                   - Google Maps geocoding results
     * @param   {number} results[0].geometry.location.lat() - latitude
     * @param   {number} results[0].geometry.location.lng() - longitude
     *
     * @return  undefined
     */
    _geocode_success: function(results) {
        // TODO: actually implement default behaviour
        console.log({latitude: results[0].geometry.location.lat(), longitude: results[0].geometry.location.lng()});
        utils.loaderOverlayDone();
    },

    /**
     * @name    _geocode_error
     *
     * @param   {string} status     - Geocoder status, one of:
     *                              - google.maps.GeocoderStatus.ZERO_RESULTS
     *                              - google.maps.GeocoderStatus.INVALID_REQUEST
     *                              - google.maps.GeocoderStatus.OVER_QUERY_LIMIT:
     *                              - google.maps.GeocoderStatus.REQUEST_DENIED:
     *
     * @return  undefined
     */
    _geocode_error: function(status) {
        var m = "";
        switch (status) {
            case google.maps.GeocoderStatus.ZERO_RESULTS:
            case google.maps.GeocoderStatus.INVALID_REQUEST:
                m = "No results found. Enter another address and try again. ";
                break;
            case google.maps.GeocoderStatus.OVER_QUERY_LIMIT:
            case google.maps.GeocoderStatus.REQUEST_DENIED:
                m = "There was an error getting your address. Please try again later.";
                break;
            default:
                m = "An error occurred.";
        }
        toast(m, utils._defaultToastLength);
        utils.loaderOverlayDone();
    },

    /**
     * Creates spinning preloader. Call when an action requiring a loader is performed.
     * @return undefined
     */

    loaderOverlay: function() {
        document.getElementById("preloader-overlay").style.display = "block";
        $(".preloader-bg").addClass("animated-fast fadeInDown")
    },

    /**
    * Removes preloader. Call upon completion of action.
    * @return undefined
    */
    loaderOverlayDone: function() {
        document.getElementById("preloader-overlay").style.display = "none";
        $(".preloader-bg").removeClass("animated-fast fadeInDown");
    }
}