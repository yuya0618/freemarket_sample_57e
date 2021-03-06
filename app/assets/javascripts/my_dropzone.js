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
    // console.log(itemValidation());
    if (itemValidation() == false) {
      errorMessage();
      $( "#item-submit").prop( "disabled", false );
    } else {
      let formDataAry = $(this).serializeArray();
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

    }
    $( "#item-submit").prop( "disabled", false );
  });

  // $( "#item-submit").change(function(){
  //   console.log('変わった！');
  //   console.log($( "#item-submit").prop( "disabled"));
  // })

});