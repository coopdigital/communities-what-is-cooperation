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
  $('.thumbs-up-down').hide();
  $('.thumbs-up-down:first').show();

  $('.thumbs-up-down input[type=radio]').change(function(){
    var radio_button = $(this);
    var current_fieldset = radio_button.parents('fieldset');
    var form = radio_button.parents('form');
    if( $('.thumbs-up-down:last').is(":visible") ) {
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
