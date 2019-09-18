$(document).on('turbolinks:load', function() {

  Dropzone.autoDiscover = false;

  let myDropzone;

  if ($("#file-drop-area")[0] != null && myDropzone == undefined ){
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
  };


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
      console.log(response);
    })

  });

});