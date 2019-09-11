$(function(){
  function buildImage(){
    var html = `<div class="item-registration__form__group-images-image">
                  <img class="item-registration__form__group-images-image-pic" style="height:150px;" src="/uploads/image/image/5/IMG_8538.JPG">
                  <div class="item-registration__form__group-images-image-btn">
                    <div class="item-registration__form__group-images-image-btn-edit">
                      <a class="item-registration__form__group-images-image-btn-edit-btn" href="#">編集</a>
                    </div>
                    <div class="item-registration__form__group-images-image-btn-delete">
                      <a class="item-registration__form__group-images-image-btn-delete-btn" rel="nofollow" data-method="delete" href="/">削除</a>
                    </div>
                  </div>
                </div>tn-edit"></div>`
    return html;
  };

  // 画像選択時
  $('#edit-image').on('change', function(e){
    debugger;
    var html = buildImage;
    $('.item-registration__form__group-images').prepend(html);
  })

});