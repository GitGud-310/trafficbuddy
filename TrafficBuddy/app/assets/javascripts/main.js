// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// //You can use CoffeeScript in this file: http://coffeescript.org/
var ready = function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal({
        ready: function() {
            $('#new_location, #first_name').filter(':visible').focus();
        }
    });

    $('.button-collapse').sideNav({
        menuWidth: 300,
        edge:   'right'
    });

    // Show sideNav
    $('.button-collapse').sideNav('show');
    // Hide sideNav
    $('.button-collapse').sideNav('hide');


};

$(document).ready(ready);
$(document).on('page:load', ready);