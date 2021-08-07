
// $(function () {
//   $('#cover_image').on('click', function () {
//       $("#article_image").click();
//       return false; // must!
//   })
// });

// $(function(){
//   $('#article_image').change(function(e){
//     //ファイルオブジェクトを取得する
//     var file = e.target.files[0];
//     var reader = new FileReader();
 
//     //画像でない場合は処理終了
//     if(file.type.indexOf("image") < 0){
//       alert("画像ファイルを指定してください。");
//       return false;
//     }
 
//     //アップロードした画像を設定する
//     reader.onload = (function(file){
//       return function(e){
//         $(".article_image").attr("src", e.target.result);
//         // $("#img1").attr("title", file.name);
//       };
//     })(file);
//     reader.readAsDataURL(file);
 
//   });
// });

//FORM CLOSE
function newFormClose(){
    $('.js-form-close').on('click',function(){

        if($('#new-form').hasClass("active")){

            $("#new-form").removeClass("active");

        }
    });
        return false;
};

function editFormClose(){
    $('.js-form-close').on('click',function(){

        if($('#edit-form').hasClass("active")){
            $("#edit-form").removeClass("active");
        }
    });
    return false;
};

//投稿完了メッセージ
function postSuccessMsg(msg){
    document.getElementById('post-success-msg').innerText = msg;
    setTimeout(function(){
        $('#post-success-msg').addClass('active');
    },800);
    setTimeout(function(){
        $('#post-success-msg').removeClass('active');
    },3000);
};

function postBtnUp(){
    setTimeout(function(){
        $('#new-btn').addClass('up');
    },800);
    setTimeout(function(){
        $('#new-btn').removeClass('up');
    },3000);
};

