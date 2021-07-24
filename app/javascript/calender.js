document.addEventListener('DOMContentLoaded', function() {
  const KEY = gon.google_calender_API_key;// 環境変数

  let calendar = new FullCalendar.Calendar(document.getElementById('calender'), {
    // google apiを叩く
    googleCalendarApiKey:'AIzaSyBphPljC66Tbjuo5m8EHkD4BrywVTb2X_8',
    eventSources: [
      {
        googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
        className: 'event_holiday',
        textColor: 'rgb(224, 102, 122)',
        eventDisplay: 'none'
      },
      {
        googleCalendarId: 'forza.kanazawa.volleyball@gmail.com',
        className: 'forza_cal_event',
      }
    ],
    // ここまで

    // events: 'forza.kanazawa.volleyball@gmail.com',


    // 日付枠内の日付を数字のみにする
    dayCellContent: function (e) {
      e.dayNumberText = e.dayNumberText.replace('日', '');
    },

    // 祝日の背景もグレーにする
    eventDidMount: function(e) {
      console.log(e);

      let el = e.el;
      // 時間の〜を作る
      let t = el.querySelectorAll('.fc-event-time');
      // console.log(t);
      t.forEach(element => {
        element.insertAdjacentHTML('beforeend', '~')
      });

      if ( el.classList.contains('event_holiday') ) {
        if ( e.view.type == "dayGridMonth" ) { //カレンダー(月)表示の場合
       //イベントが表示される場所の親をたどって各日の枠にたどり着いたらclassを授けよう
          el.closest('.fc-daygrid-day').classList.add('is_holiday');
        }
      }
      // 同様にforzaのカレンダーにはforza_eventをクラスに追加
      if ( el.classList.contains('forza_cal_event') ) {
        if ( e.view.type == "dayGridMonth" ) { 
          el.closest('.fc-daygrid-day').classList.add('forza_event');
        }
      }
    },

    headerToolbar: {
      left: "",
      center: "title",
      right: ""
    },

    
    locale: 'ja',
    navLinks: false,
    // businessHours: true,
    editable: false,
    height: 400,
    timeZone: 'Asia/Tokyo',
    // aspectRatio: 2,


    eventTimeFormat: { hour: 'numeric', minute: '2-digit' },
    
  });
  
  calendar.render();


});



