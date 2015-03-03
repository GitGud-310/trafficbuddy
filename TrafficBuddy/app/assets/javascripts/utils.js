var utils = {
    
    /**
     * @returns {object} position            - Current user position
     * @returns {number} position.latitude   - Latitude of position
     * @returns {number} position.longitude  - Longitude of position
     */
    geolocate: function() {
        if ('geolocation' in navigator) {
            navigator.geolocation.getCurrentPosition(function (position) {
                    return {latitude: position.coords.latitude, longitude: position.coords.longitude};
                },
                function (error) {
                    // TODO: Add error message for error in geolocation
                });
        } else {
            // TODO: Add error message for unsupported broswer
        }
    },

    /**
     * @params  {string} address             - User entered address/location
     *
     * @returns {object} position            - Current user position
     * @returns {number} position.latitude   - Latitude of position
     * @returns {number} position.longitude  - Longitude of position
     */
    geocode: function(address) {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                return {latitude: results[0].geometry.location.lat(), longitude: results[0].geometry.location.lng()};
            } else {
                // TODO: Add error message handling for geocoder error
            }
        });
    }
}