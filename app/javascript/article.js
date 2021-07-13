
$(function () {
  $('#cover_image').on('click', function () {
      $("#article_image").click();
      return false; // must!
  })
});

$(function(){
  $('#article_image').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
 
    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
 
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $(".article_image").attr("src", e.target.result);
        // $("#img1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
 
  });
});


$(window).on('load', function(){
  $('body').removeClass('fadeout');
});

$(function() {
  // ハッシュリンク(#)と別ウィンドウでページを開く場合はスルー
  $('a:not([href^="#"]):not([target])').on('click', function(e){
    e.preventDefault(); // ナビゲートをキャンセル
    url = $(this).attr('href'); // 遷移先のURLを取得
    if (url !== '') {
      $('body').addClass('fadeout');  // bodyに class="fadeout"を挿入
      setTimeout(function(){
        window.location = url;  // 0.8秒後に取得したURLに遷移
      }, 1000);
    }
    return false;
  });
});