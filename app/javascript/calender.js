document.addEventListener('DOMContentLoaded', function() {
  let calendar = new FullCalendar.Calendar(document.getElementById('calender'), {
    initialView: 'dayGridMonth'
  });
  calendar.render();
});