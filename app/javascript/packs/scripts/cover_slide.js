$(window).on('scroll',function (){
   //表示させる要素の位置を取得
    var elemPos = $('.grid').offset().top;
  //スクロール量を取得
    var scroll = $(window).scrollTop();
  //画面サイズを取得
    var windowHeight = $(window).height();

    if( scroll > elemPos - windowHeight + 200 ){
    
    //時間差でフェイドインするクラスを追加する
      $('.img-fade-up').each(function(i){

        var $this = $(this);

        $this.delay( i * 400 ).queue(function(next){

          $this.addClass('effect-scroll');
          next();

        });
      });
    }
console.log('aa');

});
