$(document).on('turbolinks:load', function() {

  Dropzone.autoDiscover = false;

  let myDropzone;

  if ($("#file-drop-area")[0] != null){
    myDropzone = new Dropzone("#file-drop-area", {
      url: "/items",
      uploadMultiple: true,
      parallelUploads: 10,
      paramName: "images[image]",
      maxFiles: 10,
      previewsContainer: '.dropzone-previews',
      addRemoveLinks: true,
      dictRemoveFile: "削除",
      headers: {"Accept": "text/javascript"},
      dictMaxFilesExceeded: "10 files limit",
      dictInvalidFileType: "Image file only",
      autoProcessQueue: false
    });
  }


  $('#item-registration-form').submit(function(e) {
    e.preventDefault();
    let formDataAry = $(this).serializeArray();
    console.log(formDataAry);
    let csrfToken = $('input[name="authenticity_token"]').val();
    // console.log(...formData.entries());
    let current_scrollY = $(window).scrollTop(); 
    myDropzone.on("sending", function(file, xhr, formData) {
      formData.append("authenticity_token", csrfToken);
      formData.append("current_scrollY", current_scrollY)
      formDataAry.forEach(function(fields){
        formData.append(fields.name, fields.value);
      })
    });
  
    myDropzone.processQueue();

    myDropzone.on("success", function(file, response) {
      eval(response);
    })

  });

});





// $(function(){
//   // 初期設定とか
//   Dropzone.autoDiscover = false;
//   Dropzone.options.uploadDropzone = {
//     paramName : "file",
//     paralleUploads : 1,
//     acceptedFiles : 'image/*',
//     maxFiles: 6,
//     maxFilesize: 3,
//     dictFileTooBig: "ファイルが大きすぎます。(@{{filesize}}MB). 最大サイズ: @{{maxFilesize}}MB.",
//     dictInvalidFileType: "画像ファイルのみアップロードが可能です。",
//     dictMaxFilesExceeded: "ファイルは6ファイルまで追加が可能です。",
//     dictDefaultMessage: "ここへファイルをドラッグ＆ドロップするとアップロードされます。<br>最大6ファイルまでアップ可能です。<br><br>（もしくはここをクリックするとファイル選択ウインドウが表示されますのでそこで選択してもアップ可能です）"
//   };

//   // ここからがタイトルに書いた内容になる。
//   var myDropzone = new Dropzone('.item-registration__form__group__image', {
//     url : "/items",
//     addRemoveLinks: true,
//     dictRemoveFile: "削除",
//   }).on("success", function(file, serverResponse){
//     // serverResponseにはアップロードされたファイルの名前が返ってくる
//     file.previewElement.querySelector("img").alt = serverResponse;
//   }).on("removedfile", function(file){
//     // 削除ボタンが押された時
//     console.log( file.previewElement.querySelector("img").alt ); // 削除対象のファイル名が取得出来る
//     $.ajax(...);//あとは非同期でファイル名を指定して削除するサーバサイドプログラムへリクエスト
//   });
// });