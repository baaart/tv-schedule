// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require moment
//= require fullcalendar
//= require scheduler
//= require_tree .

$.urlParam = function (name) {
                var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
                if (results) {
                  return results[1] || 0;
                }
                return 0;
            }

genres = { 'comedy':'green', 'horror':'red', 'series':'blue',
          'sci-fi':'brown', 'romance':'violet', 'news':'orange' }

$( document ).ready(function() {
  $('#calendar').fullCalendar({
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    aspectRatio: 1.8,
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'timelineDay,timelineThreeDays'
    },
    defaultView: 'timelineDay',
    timeFormat: 'H(:mm)',
    views: {
      timelineThreeDays: {
        type: 'timeline',
        duration: { days: 3 }
      }
    },
    resourceLabelText: 'Channels',
    resources: '/api/v1/channels',
    events: function(start,end,timezone,callback)
        {
            $.ajax({
              url: $.urlParam('q') != 0 ? '/api/v1/schedules/search?q=' + $.urlParam('q')  :'/api/v1/schedules',
              dataType: "json",
              success: function(data) {
                var events = [];
                $.each(data, function(index, schedule) {
                    events.push({
                      id: schedule.id,
                      title: schedule.show.title,
                      start: schedule.start_time,
                      end: schedule.end_time,
                      resourceId: schedule.channel.id,
                      color: genres[schedule.show.category.name]
                    });
                });
                callback(events);
              },
              error: function (request, status, error) {
                console.log('An error ocured on backend server')
                callback([]);
              }
            });
        }
  });
});
