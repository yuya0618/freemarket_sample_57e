$(document).on('turbolinks:load', function() {

  // 検索機能の親カテゴリー発火
  $('#q_category_id').change(function() {
    let parentId = $('#q_category_id').val();
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
  $(document).on('change', '#category_children', function() {
    let childrenId = $('#category_children').val();
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

});