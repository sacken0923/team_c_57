$(function(){
  $("#new_user").validate({
    rules: {
        "user[nickname]": {
            required: true,
        },
        "user[email]": {
            required: true,
        },
        "user[password]": {
            required: true,
            rangelength: [7,128]
        },
        "user[password_confirmation]": {
            required: true,
            equalTo: "#user_password"
        },
        "user[last_name]": {
            required: true,
        },
        "user[first_name]": {
            required: true,
        },
        "user[kana_last_name]": {
            required: true,
        },
        "user[kana_first_name]": {
            required: true,
        },
        "user[year]": {
            required: true,
        },
        "user[month]": {
            required: true,
        },
        "user[day]": {
            required: true,
        },
        "user[tell]": {
            required: true,
        },
        "user[address_last_name]": {
            required: true,
        },
        "user[address_first_name]": {
            required: true,
        },
        "user[kana_address_last_name]": {
            required: true,
        },
        "user[kana_address_first_name]": {
            required: true,
        },
        "user[postal_code]": {
            required: true,
        },
        "user[prefecture]": {
            required: true,
        },
        "user[city]": {
            required: true,
        },
        "user[address]": {
            required: true,
        },
    },
    messages: {
        "user[nickname]": {
            required: "お名前を入力してください。",
        },
        "user[eamil]": {
            required: "メールアドレスを入力してください。",
        },
        "user[password]": {
            required: "パスワードを入力してください。",
            rangelength: "パスワードは7文字以上128文字以下で入力してください"
        },
        "user[password_confirmation]": {
            required: "パスワード(確認)を入力してください。",
            equalTo: "パスワードとパスワード(確認)が一致しません"
        },
        "user[last_name]": {
            required: "(姓)を入力してください",
        },
        "user[first_name]": {
            required: "(名)を入力してください",
        },
        "user[kana_last_name]": {
            required: "お名前カナ(姓)を入力してください",
        },
        "user[kana_first_name]": {
            required: "お名前カナ(名)を入力してください",
        },
        "user[year]": {
            required: "生年月日(年)を入力してください",
        },
        "user[month]": {
            required:  "生年月日(月)を入力してください",
        },
        "user[day]": {
            required:  "生年月日(日)を入力してください",
        },
        "user[tell]": {
            required: "電話番号を入力してください",
        },
        "user[address_last_name]": {
            required: "(姓)を入力してください",
        },
        "user[address_first_name]": {
            required: "(名)を入力してください",
        },
        "user[kana_address_last_name]": {
            required: "お名前カナ(姓)を入力してください",
        },
        "user[kana_address_first_name]": {
            required: "お名前カナ(名)を入力してください",
        },
        "user[postal_code]": {
            required: "郵便番号を入力してください",
        },
        "user[prefecture]": {
            required: "都道府県を選択してください",
        },
        "user[city]": {
            required: "市町村を入力してください",
        },
        "user[address]": {
            required: "番地を入力してください",
        },
    },
    errorPlacement: function(error, element) {
			switch(element.attr('name')) {
        case "user[last_name]":
          error.insertAfter($('#lastname'));
          break;
        case "user[first_name]":
          error.insertAfter($('#firstname'));
          break;
        case "user[kana_last_name]":
          error.insertAfter($('#kana_lastname'));
          break;
        case "user[kana_first_name]":
          error.insertAfter($('#kana_firstname'));
          break;
        case "user[year]":
          error.insertAfter($('#select-year'));
          break;
        case "user[month]":
          error.insertAfter($('#select-month'));
          break;
        case "user[day]":
          error.insertAfter($('#select-day'));
          break;
        default:
          error.insertAfter(element);
      }
    }
  });
});

