$(function(){
    $('.js-modal-open').on('click',function(){
        $('.js-modal').fadeIn();
        return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal').fadeOut();
        $('.js-form')[0].reset();
        $('.js-message-errors').empty(); // 追加
        return false;
    });
});