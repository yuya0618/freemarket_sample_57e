// let myDropzone = {};

// Dropzone.autoDiscover = false;

// Dropzone.options.myAwesomeDropzone = {
//   paramName: "file",
//   parallelUploads: 1,
//   acceptedFiles: 'image/*',
//   maxFiles: 2,
//   maxFilesize: 0.5,
//   dictFileTooBig: "uploaded file is too large({{filesize}}MiB). limit: {{maxFilesize}}MiB.",
//   dictInvalidFileType: "Image file only",
//   dictMaxFilesExceeded: "10 files limit"
// };

// myDropzone = new Dropzone(".item-registration__form__group__image", {
//   url: "/items"
// });

$(function() {

Dropzone.autoDiscover = false;

let myDropzone = new Dropzone(".item-registration__form__group__image", {
  url: "/items",
  paramName: "file",
  addRemoveLinks: true,
  dictRemoveFile: "削除",
  autoProcessQueue: false
});

$('form').submit(function() {
  myDropzone.processQueue();
});

});




$(function() {
  let myDropzone;
  Dropzone.autoDiscover = false;
  Dropzone.options.myAwesomeDropzone = {
    paramName: "file",
    parallelUploads: 1,
    acceptedFiles: 'image/*',
    maxFiles: 2,
    maxFilesize: 0.5,
    dictFileTooBig: "uploaded file is too large({{filesize}}MiB). limit: {{maxFilesize}}MiB.",
    dictInvalidFileType: "Image file only",
    dictMaxFilesExceeded: "10 files limit"
  };

  myDropzone = new Dropzone(".item-registration__form__group__image", {
    url: "/items",
    addRemoveLinks: true,
    dictRemoveFile: "削除",
    autoProcessQueue: false
  });

  $('form').submit(function() {
    myDropzone.processQueue();
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
    // addRemoveLinks: true,
    // dictRemoveFile: "削除",
//   }).on("success", function(file, serverResponse){
//     // serverResponseにはアップロードされたファイルの名前が返ってくる
//     file.previewElement.querySelector("img").alt = serverResponse;
//   }).on("removedfile", function(file){
//     // 削除ボタンが押された時
//     console.log( file.previewElement.querySelector("img").alt ); // 削除対象のファイル名が取得出来る
//     $.ajax(...);//あとは非同期でファイル名を指定して削除するサーバサイドプログラムへリクエスト
//   });
// });