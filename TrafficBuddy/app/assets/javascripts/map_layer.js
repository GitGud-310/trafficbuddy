/**
 * Created by takea on 15-03-10.
 */
function mapLayer(map) {
    var trafficLayer = new google.maps.TrafficLayer();
    trafficLayer.setMap(map);

    /* using gon gem, set this variable in controller
    gon.traffic_events = TrafficEvent.all
     */

    var events = gon.traffic_events;

    for (i=0; i < events.length; i++) {

        var latlons = events[i].lat_lons;
        var latlons_length = events[i].lat_lons.length;
        var latlon1 = latlons[0];
        var latlon2 = latlons[latlon_length-1];

        if (latlons_length == 1) {
            putIcon(latlon1, map);
        } else {
            putIcon(latlon1, map);
            putIcon(latlon2, map);
            drawLine(latlons, map);
        }
    }
}

function putIcon(latlon, map) {
    var myLatlon = new google.maps.LatLng(latlon.latitude, latlon.longitude);

    var image = 'images/favicon.ico';
    var marker = new google.maps.Marker({
        position: myLatlon,
        map: map,
        icon: image
    });
}

function drawLine(latlons, map) {
    for (i=0; i < latlons.length - 1; i++) {
        drawLineHelper(latlons[i], latlons[i+1], map);
    }
}

function drawLineHelper(latlon_start, latlon_end, map) {

    //not sure about svg notation

    var path = 'M 0,0 ';
    var dif_x = latlon_end.longitude - latlon_start.longitude;
    var dif_y = latlon_start.latitude - latlon_end.latitude;
    path = path.concat(dif_x.toString(), ',', dif_y.toString());


    var lineSymbol = {
        path: path,
        strokeOpacity: 1,
        scale: 1
    };

    var lineCoordinates = [
        new google.maps.LatLng(latlon_start.latitude, latlon_start.longitude),
        new google.maps.LatLng(latlon_end.latitude, latlon_end.longitude)
    ];


    var line = new google.maps.Polyline({
        path: lineCoordinates,
        strokeOpacity: 0,
        icons: [{
            icon: lineSymbol,
            offset: '0',
            repeat: '20px'
        }],
        map: map
    });
}
