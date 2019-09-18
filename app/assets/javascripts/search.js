$(document).on('turbolinks:load', function() {

  // 検索機能の親カテゴリー発火
  $('.parent_category').change(function() {
    let parentId = $('.parent_category').val();
    console.log(parentId);
    $.ajax({
      url: '/items/searchChild',
      type: "GET",
      data: { parentId: parentId },
      dataType: 'script'
    })

    .done(function(){
      console.log('doooone!!');
    })

    .fail(function(jqXHR, textStatus, errorThrown){
      console.log('faaaaaail!!');
      // alert('ファイルの取得に失敗しました。');
      console.log("ajax通信に失敗しました");
      console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
      console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
      console.log("errorThrown    : " + errorThrown.message); // 例外情報
      // console.log("URL            : " + url);
    })
  });

  // 検索機能の子カテゴリー発火
  $(document).on('change', '.child_category', function() {
    let childrenId = $('.child_category').val();
    console.log(childrenId);
    $.ajax({
      url: '/items/searchGchild',
      type: "GET",
      data: { childrenId: childrenId },
      dataType: 'script'
    })

    .done(function(){
      console.log('dooooneggg!!');
    })

    .fail(function(jqXHR, textStatus, errorThrown){
      console.log('faaaaaailggg!!');
      // alert('ファイルの取得に失敗しました。');
      console.log("ajax通信に失敗しました");
      console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
      console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
      console.log("errorThrown    : " + errorThrown.message); // 例外情報
      // console.log("URL            : " + url);
    })
  });

  // ブランドインクリ
  $(document).on('keyup', '#q_brand_name_eq', function() {
    let input = $("#q_brand_name_eq").val();
      $.ajax({
        url: '/items/brand_search2',
        type: "GET",
        data: {
          keyword: input,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
      })
  });

  $(document).on('click', '.brand-suggest__list > li', function() {
    let brandSelected = $(this).text();
    let brandId = $(this).attr('id');
    console.log(brandSelected)
    $('#q_brand_name_eq').val(brandSelected);
    $('#item_brand_id').val(brandId);
    $('.brand-suggest__list').remove();
  })

});