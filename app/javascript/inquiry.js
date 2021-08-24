$(function(){


  $(".form-inquiry").on("submit", function(){
    
    $('.contact-area-link').addClass("loading");
    $('.form-last').append('<div class="spinner"></div>');
    setTimeout(() => {
    $('.contact-area-link').val("")
  }, 300);
  })


});