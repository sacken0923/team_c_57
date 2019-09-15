$(function(){
  $("#item_price").on("change",function(){
    var price = document.getElementById("item_price").value;
    var fee = Math.floor(price*0.1)
    var profit = Math.floor(price*0.9)
    var feehtml = `<p>${fee}円</p>`
    var profithtml = `<p>${profit}円</p>`
      if(!isNaN(price) && price >= 300){
        $("#fee_before").empty();
        $("#fee_before").html(feehtml);
        $("#profit_before").empty();
        $("#profit_before").html(profithtml);
      }
  });
});