// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// //You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
$('.modal-trigger').leanModal();

    $('.button-collapse').sideNav({
        edge:   'right'
    });

// Show sideNav
    $('.button-collapse').sideNav('show');
// Hide sideNav
    $('.button-collapse').sideNav('hide');
});