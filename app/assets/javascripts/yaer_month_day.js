$(function(){
  var time = new Date();
  var year = time.getFullYear();
  for (var i = year; i >= 1900; i--) {
    $('#user_year').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 12; i++) {
      $('#user_month').append('<option value="' + i + '">' + i + '</option>');
  }
  $(document).on('change','#user_month',function(){
    var monthselect = document.getElementById("user_month").value;
      if(monthselect == 2 ){
        for (var i = 1; i <=  29; i++) {
          $('#user_day').append('<option value="' + i + '">' + i + '</option>');
        }
      }else if(monthselect == 4 || monthselect == 6 || monthselect == 9 || monthselect == 11 ){
        for (var i = 1; i <=  30; i++) {
          $('#user_day').append('<option value="' + i + '">' + i + '</option>');
        }
      }else{
        for (var i = 1; i <=  31; i++) {
          $('#user_day').append('<option value="' + i + '">' + i + '</option>');
        }
      }
  })
});