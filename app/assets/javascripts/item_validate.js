$(function(){
  $("#new_item").validate({
    rules: {
      "item[photos_attributes][0][image]":{
        required: true,
      },
      "item[name]":{
        required: true,
      },
      "item[description]":{
        required: true,
      },
      "item[category_id]":{
        required: true,
      },
      "item[state]":{
        required: true,
      },
      "item[delivery]":{
        required: true,
      },
      "item[shipping_method]":{
        required: true,
      },
      "item[region]":{
        required: true,
      },
      "item[shipping_time]":{
        required: true,
      },
      "item[price]":{
        required: true,
      },
    },
    messages: {
      "item[photos_attributes][0][image]":{
        required: "aaaa",
      },
      "item[name]":{
        required: "入力してください",
      },
      "item[description]":{
        required: "選択してください",
      },
      "item[category_id]":{
        required: "選択してください",
      },
      "item[state]":{
        required: "選択してください",
      },
      "item[delivery]":{
        required: "選択してください",
      },
      "item[shipping_method]":{
        required: "選択してください",
      },
      "item[region]":{
        required: "選択してください",
      },
      "item[shipping_time]":{
        required: "選択してください",
      },
      "item[price]":{
        required: "300以上9999999以下で入力してください",
      },
    },
    errorPlacement: function(error, element) {
			switch(element.attr('name')) {
        case "item[price]":
          error.insertAfter($('#price'));
          break;
        default:
          error.insertAfter(element);
      }
    }
  });
});