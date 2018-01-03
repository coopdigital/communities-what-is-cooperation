// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require_tree .

$(document).ready(function(){
  var required_interests = 5;

  $('.thumbs-up-down').hide();
  $('.thumbs-up-down:first').show();

  $('.thumbs-up-down input[type=radio]').change(function(){
    var radio_button = $(this);
    var current_fieldset = radio_button.parents('fieldset');
    var form = radio_button.parents('form');
    if($('.thumbs-up-down input:checked[value=yes]').length == required_interests) {
      form.submit();
    } else {
      var next_fieldset = current_fieldset.next('fieldset');
      if(next_fieldset.length > 0){
        current_fieldset.hide();
        next_fieldset.show();
      } else {
        form.submit();
      }
    }
  });
});


$(document).ready(function(){
  if($('#member-map').length > 0){
    initMap();
  }
});

function initMap(){
  var geocoder = new google.maps.Geocoder();
  var postcode = $('#member-map').data('postcode');
  geocoder.geocode( {address: postcode, componentRestrictions: {country: 'UK'}}, function(results, status) {
    if (status == 'OK') {
      var postcode_centre = results[0].geometry.location;
      var map = new google.maps.Map(document.getElementById('member-map'), {
        center: postcode_centre,
        zoom: 14
      });
      var colorPolygonLayer = r360.googleMapsPolygonLayer(map);
      setDistance(colorPolygonLayer, postcode_centre);
      $('#submission_distance').change(function(){
        setDistance(colorPolygonLayer, postcode_centre);
      });
      $('#submission_distance_mode').change(function(){
        setDistance(colorPolygonLayer, postcode_centre);
      });
    }
  });
}

function setDistance(colorPolygonLayer, lat_lng){
  var distanceMinutes = $('#submission_distance').val();
  var travelType = $('#submission_distance_mode').val();
  showDistance(colorPolygonLayer, lat_lng.lat(), lat_lng.lng(), travelType, distanceMinutes * 60);
}

function showDistance(layer, lat, lng, travelType, time) {
  var travelOptions = r360.travelOptions();
  travelOptions.setServiceKey($('#member-map').data('route360-key'));
  travelOptions.setServiceUrl("https://service.route360.net/britishisles/");
  travelOptions.addSource({ lat: lat, lng: lng });
  travelOptions.setTravelTimes([time]);
  travelOptions.setTravelType(travelType);

  // call the service
  r360.PolygonService.getTravelTimePolygons(travelOptions,
    function(polygons) {
      layer.update(polygons);
      layer.fitMap();
    },
    function(status, message) {
      console.log("The route360 API is not available - double check your configuration options.");
    }
  );
}

$(document).ready(function(){
  // Parse the URL parameter
  function getParameterByName(name, url) {
      if (!url) url = window.location.href;
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
          results = regex.exec(url);
      if (!results) return null;
      if (!results[2]) return '';
      return decodeURIComponent(results[2].replace(/\+/g, " "));
  }
  // Give the parameter a variable name
  var newLocation = getParameterByName('location');
  if (newLocation == null) {
    console.log("No location set");
  } else {
    $('#set-location').replaceWith(newLocation);
  }

});
