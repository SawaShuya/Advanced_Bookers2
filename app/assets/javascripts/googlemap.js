function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15
  });
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( { 'address': gon.user_address}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          title: gon.user_address
      });
    } else {
      alert('該当する結果がありませんでした：' + status);
      var latlng = new google.maps.LatLng(35.68145404891832, 139.76715698459228);
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        position: {lat: 35.681454048918326, lng: 139.76715698459228},
        map: map,
        title: '東京駅'
        });
    }
  });
}
