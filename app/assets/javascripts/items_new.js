$(document).on('turbolinks:load', function() {

  $('#item_price').on('keyup', function() {
    let input = $('#item_price').val();
    console.log(input);
    let price = Number(input);
    if (typeof price == 'number' && 9999999 >= price && price >= 300){
    let comissionFee = Math.floor(price / 10);
    let profit = price - comissionFee;
    $('.item-price__box__list--right > p').text('¥' + comissionFee.toLocaleString());
    $('.item-price__box__list--right > h3').text('¥' + profit.toLocaleString());
  } else {
    $('.item-price__box__list--right > p').text('-');
    $('.item-price__box__list--right > h3').text('-');
  }
  })


  $('#item_category_parent_id').change(function() {
    let parentId = $('#item_category_parent_id').val();
    console.log(parentId);
    $.ajax({
      url: '/items/children',
      type: "GET",
      data: { parentId: parentId },
      dataType: 'script'
    })

    .done(function(){
      console.log('doooone!!');
    })

    .fail(function(jqXHR, textStatus, errorThrown){
      console.log('faaaaaail!!');
      alert('ファイルの取得に失敗しました。');
      console.log("ajax通信に失敗しました");
      console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
      console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
      console.log("errorThrown    : " + errorThrown.message); // 例外情報
      // console.log("URL            : " + url);
    })
  });


  $(document).on('change', '#item_category_children_id', function() {
    let childrenId = $('#item_category_children_id').val();
    console.log(childrenId);
    $.ajax({
      url: '/items/gchildren',
      type: "GET",
      data: { childrenId: childrenId },
      dataType: 'script'
    })

    .done(function(){
      console.log('dooooneggg!!');
    })

    .fail(function(jqXHR, textStatus, errorThrown){
      console.log('faaaaaailggg!!');
      alert('ファイルの取得に失敗しました。');
      console.log("ajax通信に失敗しました");
      console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
      console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
      console.log("errorThrown    : " + errorThrown.message); // 例外情報
      // console.log("URL            : " + url);
    })
  });


  $(document).on('change', '#item_category_id', function() {
    let childrenId = $('#item_category_children_id').val();
    let gchildrenId = $('#item_category_id').val();
    console.log(childrenId);
    $.ajax({
      url: '/items/size',
      type: "GET",
      data: { childrenId: childrenId, gchildrenId: gchildrenId},
      dataType: 'script'
    })

    .done(function(){
      console.log('doooonesss!!');
    })

    .fail(function(jqXHR, textStatus, errorThrown){
      console.log('faaaaaailsss!!');
      alert('ファイルの取得に失敗しました。');
      console.log("ajax通信に失敗しました");
      console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
      console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
      console.log("errorThrown    : " + errorThrown.message); // 例外情報
      // console.log("URL            : " + url);
      $('.item-registration__form__detail__box__size').remove();
    })
  });


});