$(function(){
  $("#item_price").on("keyup",function(){
    var price = document.getElementById("item_price").value;
    var fee = Math.floor(price*0.1)
    var profit = Math.ceil(price - price*0.1)
    var feehtml = `<p>￥${fee}</p>`
    var profithtml = `<p class="profit">￥${profit}</p>`
      if(!isNaN(price) && price >= 300){
        $("#fee_before").empty();
        $("#fee_before").html(feehtml);
        $("#profit_before").empty();
        $("#profit_before").html(profithtml);
      }else{
        $("#fee_before").empty();
        $("#fee_before").html(`-`);
        $("#profit_before").empty();
        $("#profit_before").html(`-`);
      }
  });
});