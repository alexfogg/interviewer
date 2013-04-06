var map;

function display_map(lat, lng, zoom)
{
  var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}

function add_marker(lat, long, title)
{
  var latlng = new google.maps.LatLng(lat, long, title);
  var marker = new google.maps.Marker({position: latlng, map: map, title: title});
  infowindow = new google.maps.InfoWindow();
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });


}