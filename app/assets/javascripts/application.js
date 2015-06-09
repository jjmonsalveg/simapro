// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
//
//= require jquery
//= require jquery.remotipart
//= require jquery_ujs
//= require bootstrap-sprockets
//= require toastr/toastr.min.js
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require inspinia.js


$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
        delay: { "show": 0, "hide": 500 }
    });
});