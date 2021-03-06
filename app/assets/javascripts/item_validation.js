function itemValidation () {
  if ( $('.dropzone-previews').children()[0] != undefined
    && $('#item_name').val() != ""
    && $('#item_details').val() != ""
    && $('#item_category_parent_id').val() != ""
    && $('#item_category_children_id').val() != ""
    && $('#item_category_id').val() != ""
    && $('#item_condition').val() != "---"
    && $('#item_delivery_fee').val() != "---"
    && $('#item_delivery_method').val() != "---"
    && $('#item_delivery_location').val() != ""
    && $('#item_delivery_term').val() != "---"
    && $('#item_price').val() != ""
    && ($('#item_price').val() >= 300 && $('#item_price').val() <= 9999999)
  ) {
    return true;
  } else {
    return false;
  }
};


function errorMessage () {
  ($('.dropzone-previews').children()[0] == undefined)
  ? $('.error-message__image').text('画像がありません')
  : $('.error-message__image').text('');

  ($('#item_name').val() == "")
  ? $('.error-message__name').text('入力してください')
  : ($('#item_name').val().length > 40)
  ? $('.error-message__name').text('40文字以下で入力してください')
  : $('.error-message__name').text('');

  ($('#item_details').val() == "")
  ? $('.error-message__details').text('入力してください')
  : ($('#item_details').val().length > 1000)
  ? $('.error-message__details').text('1000文字以下で入力してください')
  : $('.error-message__details').text('');

  ($('#item_category_parent_id').val() == ""
  || $('#item_category_children_id').val() == ""
  || $('#item_category_id').val() == ""
  ) ? $('.error-message__category').text('選択してください')
  : $('.error-message__category').text('');

  ($('#item_condition').val() == "---")
  ? $('.error-message__condition').text('選択してください')
  : $('.error-message__condition').text('');

  ($('#item_delivery_fee').val() == "---")
  ? $('.error-message__delivery-fee').text('選択してください')
  : $('.error-message__delivery-fee').text('');

  ($('#item_delivery_method').val() == "---")
  ? $('.error-message__delivery-method').text('選択してください')
  : $('.error-message__delivery-method').text('');

  ($('#item_delivery_location').val() == "")
  ? $('.error-message__delivery-location').text('選択してください')
  : $('.error-message__delivery-location').text('');

  ($('#item_delivery_term').val() == "---")
  ? $('.error-message__delivery-term').text('選択してください')
  : $('.error-message__delivery-term').text('');

  ($('#item_price').val() == "")
  && ($('#item_price').val() < 300
  || $('#item_price').val() > 9999999)
  ? $('.error-message__price').text('300以上9999999以下で入力してください')
  : $('.error-message__price').text('');

};