import Dropzone from 'dropzone'

let myDropzone = {}

dropzoneSetting()

myDropzone = new Dropzone('.item-registration__form', {
  url: '/items',
  params: {
      client_id: clientId,
  },
  dictDefaultMessage: 'ここにファイルをドラッグ＆ドロップ、または、クリックしてファイルを選択',
  dictRemoveFile: '',
  dictCancelUpload: '',
  dictFileTooBig: 'ファイルサイズは' + maxFileSize + 'MBまで',
  dictInvalidFileType: 'JPEG,PNGのみ可能',
  addRemoveLinks: true,
  maxFilesize: maxFileSize,
  acceptedFiles: 'image/*',
  parallelUploads: 1,
  uploadMultiple: true,
  previewsContainer: '.nest-form', 
  previewTemplate : $('.preview').html(),
  renameFile: (file) => {
      let fileName = new Date().getTime() + '_' + file.size

      let extension = file.name.split('.').pop()
      return fileName + '.' + extension
  },
})

var myDropzone = new Dropzone("div#myId", {
  url: "/file/post"
});
$("div#myId").dropzone({
  url: "/file/post"
});