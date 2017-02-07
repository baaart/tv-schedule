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
//= require fullcalendar.min.js
//= require scheduler
//= require demo
//= require_tree .


genres = { 'comedy':'green', 'horror':'red', 'series':'blue',
          'sci-fi':'brown', 'romance':'violet', 'news':'orange' }

$( document ).ready(function() {
  $('#calendar').fullCalendar({
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    now: '2017-02-07',
    aspectRatio: 1.8,
    scrollTime: '00:00', // undo default 6am scrollTime
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'timelineDay,timelineThreeDays,agendaWeek,month'
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
              url: '/api/v1/schedules',
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
                alert(request.responseText);
                callback([]);
              }
            });
        }
  });
});
