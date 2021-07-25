$(window).scroll(function () {
  if($(window).scrollTop() > 750) {
    $('.side').addClass('inview');
  } else {
    $('.side').removeClass('inview');
  }
});