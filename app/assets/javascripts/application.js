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

function initMap(){
  console.log('MAPS LOADED');
  var geocoder = new google.maps.Geocoder();
  var postcode = $('#member-map').data('postcode');
  geocoder.geocode( {address: postcode, componentRestrictions: {country: 'UK'}}, function(results, status) {
    if (status == 'OK') {
      console.log(results[0].geometry.location);
      var map = new google.maps.Map(document.getElementById('member-map'), {
        center: results[0].geometry.location,
        zoom: 14
      });
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
