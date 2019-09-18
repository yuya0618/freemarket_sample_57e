window.addEventListener("turbolinks:load", function() {
  // 全角カタカナのみ
  jQuery.validator.addMethod("katakana", function(value, element) {
    return this.optional(element) || /^([ァ-ヶー]+)$/.test(value);
    }, "<br/>全角カタカナを入力してください"
  );
  //電話番号（例:012-345-6789）
  jQuery.validator.addMethod("telnum", function(value, element) {
    return this.optional(element) || /^0[0-9-]{9,11}$/.test(value);
    }, "<br/>電話番号を入力してください（例:0123456789）"
  );
  //郵便番号（例:012-3456）
  jQuery.validator.addMethod("postnum", function(value, element) {
    return this.optional(element) || /^\d{3}\-\d{4}$/.test(value);
    }, "<br/>郵便番号を入力してください（例:123-4567）"
  );
  $("#user_signup-form").validate({
    rules : {
      "user[nickname]":{
        required: true,
        minlength: 2,
        maxlength: 10
      },
      "user[email]":{
        required: true,
        email: true
      },
      "user[password]":{
        required: true,
        minlength: 7
      },
      "user[password_confirmation]":{
        required: true,
        minlength: 7,
        equalTo: "#user_password"
      },
      "user[firstname]":{
        required: true
      },
      "user[lastname]":{
        required: true
      },
      "user[firstname_kana]":{
        required: true,
        katakana: true
      },
      "user[lastname_kana]":{
        required: true,
        katakana: true
      },
      "user[birth_year]":{
        required: true
      },
      "user[birth_month]":{
        required: true
      },
      "user[birth_day]":{
        required: true
      },
      "user[phone_number]":{
        required: true,
        telnum: true
      },
      "user[address_attributes][zip_code]":{
        required: true,
        postnum: true
      },
      "user[address_attributes][prefecture_id]":{
        required: true
      },
      "user[address_attributes][address_city]":{
        required: true
      },
      "user[address_attributes][address_number]":{
        required: true
      },
      "user[address_attributes][building]":{
        maxlength: 25
      },
    },
    messages : {
      "user[nickname]":{
        required: "ニックネーム は必須項目です",
        minlength: "2文字以上で入力してください",
        maxlength: "10文字以内で入力してください"
      },
      "user[email]":{
        required: "メールアドレス は必須項目です",
      },
      "user[password]":{
        required: "パスワード は必須項目です",
      },
      "user[password_confirmation]":{
        required: "パスワード再認証 は必須項目です",
      },
      "user[firstname]":{
        required: "姓 は必須項目です"
      },
      "user[lastname]":{
        required: "名 は必須項目です"
      },
      "user[firstname_kana]":{
        required: "姓(カナ) は必須項目です",
        katakana:"姓(カナ) はは全角カタカナで入力してください"
      },
      "user[lastname_kana]":{
        required: "名(カナ) は必須項目です",
        katakana:"名(カナ) は全角カタカナで入力してください"
      },
      "user[birth_year]":{
        required: "\"生年月日（年）\" は必須項目です"
      },
      "user[birth_month]":{
        required: "\"生年月日（月）\" は必須項目です"
      },
      "user[birth_day]":{
        required: "\"生年月日（日）\" は必須項目です"
      },
      "user[phone_number]":{
        required: "電話番号 は必須項目です",
        telnum: "不正な電話番号が入力されました<br/><span>・0から始まる半角数字10~12桁</span><br/><span>・\"-\"(ハイフン)を抜いた連続した数字</span><br/>上記を確認し入力してください"
      },
      "user[address_attributes][zip_code]":{
        required: "郵便番号 は必須項目です",
        postnum: "不正な郵便番号が入力されました<br/><span>・連続した数字ではないか？</span><br/><span>・前半を半角数字3文字、後半を半角数字4文字</span><br/>上記を確認し入力してください"
      },
      "user[address_attributes][prefecture_id]":{
        required: "都道府県 は必須項目です"
      },
      "user[address_attributes][address_city]":{
        required: "市区町村 は必須項目です"
      },
      "user[address_attributes][address_number]":{
        required: "番地 は必須項目です"
      },
      "user[address_attributes][building]":{
        maxlength: "建物名は25文字未満で入力してください"
      },
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
      if (element.attr('name') == 'user[email]') {
        error.appendTo($('#emsg_email'));
      }
      if (element.attr('name') == 'user[password]') {
        error.appendTo($('#emsg_password'));
      }
      if (element.attr('name') == 'user[password_confirmation]') {
        error.appendTo($('#emsg_password_confirmation'));
      }
      if (element.attr('name') == 'user[firstname]') {
        error.appendTo($('#emsg_firstname'));
      }
      if (element.attr('name') == 'user[lastname]') {
        error.appendTo($('#emsg_lastname'));
      }
      if (element.attr('name') == 'user[firstname_kana]') {
        error.appendTo($('#emsg_firstname_kana'));
      }
      if (element.attr('name') == 'user[lastname_kana]') {
        error.appendTo($('#emsg_lastname_kana'));
      }
      if (element.attr('name') == 'user[birth_year]') {
        error.appendTo($('#emsg_birth_year'));
      }
      if (element.attr('name') == 'user[birth_month]') {
        error.appendTo($('#emsg_birth_month'));
      }
      if (element.attr('name') == 'user[birth_day]') {
        error.appendTo($('#emsg_birth_day'));
      }
      if (element.attr('name') == 'user[phone_number]') {
        error.appendTo($('#emsg_phone_number'));
      }
      if (element.attr('name') == 'user[address_attributes][zip_code]') {
        error.appendTo($('#emsg_zipcode'));
      }
      if (element.attr('name') == 'user[address_attributes][prefecture_id]') {
        error.appendTo($('#emsg_address_prefecture'));
      }
      if (element.attr('name') == 'user[address_attributes][address_city]') {
        error.appendTo($('#emsg_address_city'));
      }
      if (element.attr('name') == 'user[address_attributes][address_number]') {
        error.appendTo($('#emsg_address_number'));
      }
      if (element.attr('name') == 'user[address_attributes][building]') {
        error.appendTo($('#emsg_building'));
      }
    }
  });
});