$(function(){
  $("#delivery").on("change",function(){
    $("#shipping_method").removeClass("method");
      var deliveryselect = document.getElementById("item_delivery").value;
      console.log(deliveryselect)
      if (deliveryselect === '')
        $("#shipping_method").addClass("method");
  });
});