

$(function(){
  var i = 0;
  $(document).on("change", ".input_image", function(){
  // $('.input_image').change(function(){
      var file = $(this).prop('files')[0];
      if(!file.type.match('image.*')){
          return;
      }
      var fileReader = new FileReader();
      fileReader.onloadend = function() {
        $('.edit_label').addClass('edit-hidden');
        $('.images-box').append(`<img class="image edit-image" src="${fileReader.result}" alt="Images">`);
        $('.images-box').append(`<label class="edit_label">
                                  <input name="item[photos_attributes][${i + 1}][image]" class="input_image" type="file">
                                    <div class="edit-box"></div>
                                  </label>`);
        i += 1;
      }
      fileReader.readAsDataURL(file);
  });
});

$(function(){
  $(".price-input").on("keyup",function(){
    var price = document.getElementById("item_price").value;

    var fee = Math.floor(price*0.1)
    var profit = Math.ceil(price - price*0.1)
    var feehtml = `<p>￥${fee}</p>`
    var profithtml = `<p class="profit">￥${profit}</p>`
      if(!isNaN(price) && price >= 300){
        $(".explain-fee").empty();
        $(".explain-fee").html(feehtml);
        $(".profit").empty();
        $(".profit").html(profithtml);
      }else{
        $(".explain-fee").empty();
        $(".explain-fee").html(`-`);
        $(".profit").empty();
        $(".profit").html(`-`);
      }
  });
});

$(function(){
  $(".detail-images").on("mouseover",function(){

    var image = $(this).attr('src')
    var changeImage = `<img class="detail-main-image" src="${image}" alt="Images" width="300" height="300">`
    $(".detail-main-image").remove();
    $('.detail-image-box').prepend(changeImage)
  })
})


