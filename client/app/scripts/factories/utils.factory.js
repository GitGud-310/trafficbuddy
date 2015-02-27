'use strict';

angular.module('trafficBuddyApp')
  .factory('Utils', function Utils() {
    return {
      /**
      * @returns {object} position            - Current user position
      * @returns {number} position.latitude   - Latitude of position
      * @returns {number} position.longitude  - Longitude of position
      */
      geolocate: function() {
        if ('geolocation' in navigator) {
          navigator.geolocation.getCurrentPosition(function(position) {
              var result = {};
              result.latitude = position.coords.latitude;
              result.longitude = position.coords.longitude;
              return result;
            },
            function(error) {
              // TODO: Add error message for error in geolocation
            });
        } else {
          // TODO: Add error message for unsupported broswer
        }
      }
    }
  });