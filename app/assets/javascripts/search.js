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

  // 親カテゴリーの値を取得（２周目以降）
// let parentCategoryInfo = $('.parent_category_info').html();
// // debugger;
// console.log(parentCategoryInfo);

// if (typeof parentCategoryInfo !== 'undefined' && parentCategoryInfo !== "  "){
//   // 親カテゴリーが入っている時に発火（２周目以降）
//   console.log('hoge');
//   // $('.parent_category').val(parentCategoryInfo);
//   //   console.log($('.parent_category'));
//     let parentId = $('.parent_category').val(parentCategoryInfo);
//     // parentId = Number(parentId);
//     console.log(parentId);
//     $.ajax({
//       url: '/items/searchChild',
//       type: "GET",
//       data: { parentId: parentId },
//       dataType: 'script'
//     })

//     .done(function(){
//       console.log('doooone!!');
//     })

//     .fail(function(jqXHR, textStatus, errorThrown){
//       console.log('faaaaaail!!');
//       // alert('ファイルの取得に失敗しました。');
//       console.log("ajax通信に失敗しました");
//       console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
//       console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
//       console.log("errorThrown    : " + errorThrown.message); // 例外情報
//       // console.log("URL            : " + url);
//     })
// };

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

  // 子カテゴリー２周目以降
  // $(document).on(
  //   $('.child_category').val(function() {
  //   let childrenId = $('.child_category').val();
  //   console.log(childrenId);
  //   $.ajax({
  //     url: '/items/searchGchild',
  //     type: "GET",
  //     data: { childrenId: childrenId },
  //     dataType: 'script'
  //   })

  //   .done(function(){
  //     console.log('dooooneggg!!');
  //   })

  //   .fail(function(jqXHR, textStatus, errorThrown){
  //     console.log('faaaaaailggg!!');
  //     // alert('ファイルの取得に失敗しました。');
  //     console.log("ajax通信に失敗しました");
  //     console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
  //     console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
  //     console.log("errorThrown    : " + errorThrown.message); // 例外情報
  //     // console.log("URL            : " + url);
  //   })
  // })
  // );

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

  // サイズ検索

    $('.size-select').change(function() {
      console.log($('.size-select').val());
      // 洋服のサイズ
      if ($('.size-select').val() === "洋服のサイズ"){
        const sizeGroup = [1,2,3,4,5,6,7,8,9,10];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "アクセサリーのサイズ"){
        const sizeGroup = [11,12,13,14,15,16,17,18];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "レディース靴のサイズ"){
        const sizeGroup = [19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "メンズ靴のサイズ"){
        const sizeGroup = [35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "キッズ服のサイズ"){
        const sizeGroup = [51,52,53,54,55,56,57,58,59,60,61,62];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "キッズ靴のサイズ"){
        const sizeGroup = [63,64,65,66,67,68,69,70];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "テレビのサイズ"){
        const sizeGroup = [71,72,73,74,75,76,77,78,79,80];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "バイクのサイズ"){
        const sizeGroup = [81,82,83,84,85,86];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "タイヤのサイズ"){
        const sizeGroup = [94,95,96,97,98,99,100,101,102,103,104,105,106];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "スキー板のサイズ"){
        const sizeGroup = [87,88,89,90,91,92,93];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "カメラのサイズ"){
        const sizeGroup = [107,108,109,110,111,112,113,114,115,116,117,118];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      if ($('.size-select').val() === "スノーボードのサイズ"){
        const sizeGroup = [119,120,121,122,123,124,125];
        console.log(sizeGroup);
      $.ajax({
        url: '/items/size_search',
        type: "GET",
        data: {
          sizeGroup: sizeGroup,
        },
        dataType: 'script'
      })
      .done(function(){
      })
      .fail(function(){
        // $('.item-registration__form__detail__box__size').remove();
        console.log("fail!!");
      })
      };
      // すべてに戻したら消す
      if ($('.size-select').val() === "すべて"){
        $('.search-box-group-checkbox3').remove();
      };
    });




  $(document).on('click', '.brand-suggest__list > li', function() {
    let brandSelected = $(this).text();
    let brandId = $(this).attr('id');
    console.log(brandSelected);
    $('#q_brand_name_eq').val(brandSelected);
    $('#item_brand_id').val(brandId);
    $('.brand-suggest__list').remove();
  })

});