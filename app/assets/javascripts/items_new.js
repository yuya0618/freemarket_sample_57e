$(document).on('turbolinks:load', function() {
  $('#item_price').on('keyup', function() {
    let input = $('#item_price').val();
    let price = Number(input);
    if (typeof price == 'number' && 9999999 >= price && price >= 300){
    let comissionFee = Math.floor(price / 10);
    let profit = price - comissionFee
    $('.item-price__box__list--right > p').text('¥' + comissionFee.toLocaleString());
    $('.item-price__box__list--right > h3').text('¥' + profit.toLocaleString());
  } else {
    $('.item-price__box__list--right > p').text('-');
    $('.item-price__box__list--right > h3').text('-');
  }
  })
});