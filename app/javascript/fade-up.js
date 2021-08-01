$(window).on('scroll',function (){
  $('.about_m_item_texts').each(function(){ //about_m_item_textsというクラス名が
    let elemPos = $(this).offset().top;
    let scroll = $(window).scrollTop();
    let windowHeight = $(window).height();
    if (scroll >= elemPos - windowHeight + 100){
    $(this).addClass('fadeIn');// 画面内に入ったらfadeInというクラス名を追記
    }
    });
});