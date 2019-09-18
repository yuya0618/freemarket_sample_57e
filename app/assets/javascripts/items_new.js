$(document).on('turbolinks:load', function() {

  // 親カテゴリー選択すると子カテゴリー出現
  $('#item_category_parent_id').change(function() {
    let parentId = $('#item_category_parent_id').val();
    $.ajax({
      url: '/items/children',
      type: "GET",
      data: { parentId: parentId },
      dataType: 'script'
    })
    .done(function(){
    })
    .fail(function(jqXHR, textStatus, errorThrown){
    })
  });



  // 子カテゴリー選択すると孫カテゴリー出現

  $(document).on('change', '#item_category_children_id', function() {
    let childrenId = $('#item_category_children_id').val();
    $.ajax({
      url: '/items/gchildren',
      type: "GET",
      data: { childrenId: childrenId },
      dataType: 'script'
    })
    .done(function(){
    })
    .fail(function(){
    })
  });

  // 孫カテゴリー選択するとサイズがあれば出現
  $(document).on('change', '#item_category_id', function() {
    let parentId = $('#item_category_parent_id').val();
    let childrenId = $('#item_category_children_id').val();
    let gchildrenId = $('#item_category_id').val();
    $.ajax({
      url: '/items/size',
      type: "GET",
      data: { childrenId: childrenId, gchildrenId: gchildrenId},
      dataType: 'script'
    })
    .done(function(){
    })
    .fail(function(){
      $('.item-registration__form__detail__box__size').remove();
    })
  });


  $(document).on('change', '#item_category_id', function() {
    let parentId = $('#item_category_parent_id').val();
    let childrenId = $('#item_category_children_id').val();
    let gchildrenId = $('#item_category_id').val();
    $.ajax({
      url: '/items/brand',
      type: "GET",
      data: {
        parentId: parentId,
        childrenId: childrenId,
        gchildrenId: gchildrenId
      },
      dataType: 'script'
    })
    .done(function(){
    })
    .fail(function(){
      // $('').remove();
    })
  });


  // ブランドインクリメンタルサーチ
  $(document).on('keyup', '#item_brand_name', function() {
    let input = $("#item_brand_name").val();
    let parentId = $('#item_category_parent_id').val();
    let childrenId = $('#item_category_children_id').val();
    let gchildrenId = $('#item_category_id').val();
      $.ajax({
        url: '/items/brand_search',
        type: "GET",
        data: {
          keyword: input,
          parentId: parentId,
          childrenId: childrenId,
          gchildrenId: gchildrenId
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
    $('#item_brand_name').val(brandSelected);
    $('#item_brand_id').val(brandId);
    $('.brand-suggest__list').remove();
  })


  $('#item_delivery_fee').on('change', function(){
    let deliveryFee = $('#item_delivery_fee').val();
    console.log(deliveryFee);
    $.ajax({
      url: '/items/delivery_method',
      type: "GET",
      data: { deliveryFee: deliveryFee },
      dataType: 'script'
    })
    .done(function(){
      console.log('doooone!!');
    })
    .fail(function(jqXHR, textStatus, errorThrown){
      $('.delivery-method').remove();
      console.log('faaaaaail!!');
      // alert('ファイルの取得に失敗しました。');
      console.log("ajax通信に失敗しました");
      console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
      console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
      console.log("errorThrown    : " + errorThrown.message); // 例外情報
      // console.log("URL            : " + url);
    })
  })


  $('#item_price').on('keyup', function() {
    let input = $('#item_price').val();
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

});
