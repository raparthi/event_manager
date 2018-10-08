// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require fullcalendar
//= require bootstrap-sprockets
//= require bootstrap
//= require bootstrap-datepicker
//= require fullcalendar/locale-all
//= require_tree .

$(document).ready(function(){
    $('#calendar').fullCalendar({
        // put your options and callbacks here
        events: '/events.json',
        dayClick: function () {
        },
        eventClick: function (calEvent, jsEvent, view) {

        }
    })

    $('#event_start_time, #event_end_time').datetimepicker();


});

//$(function () {
//    $('#datetimepicker1').datetimepicker();
//});