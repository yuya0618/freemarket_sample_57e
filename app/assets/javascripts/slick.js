
$(function () {
  $('.item__left__main').slick({
    arrows: false,
    asNavFor: '.item__left__sub1',
  });
  $('.item__left__sub1').slick({
    asNavFor: '.item__left__main',
    focusOnSelect: true,
    slidesToShow: 5,
  });
});