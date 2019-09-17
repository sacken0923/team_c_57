

$(function(){
  $('#item_photos').change(function(){
      var file = $(this).prop('files')[0];
      if(!file.type.match('image.*')){
          return;
      }
      var fileReader = new FileReader();
      fileReader.onloadend = function() {
        $('.edit_label').addClass('edit-hidden');
        $('.images-box').append(`<img class="image edit-image" src="${fileReader.result}" alt="Images">`);
      }
      fileReader.readAsDataURL(file);
  });
});

