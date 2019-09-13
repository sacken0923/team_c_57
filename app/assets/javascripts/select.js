$(function(){
  function  appendOption(category){
    var html = `<option value= "${category.id}">${category.name}</option>`;
    return html;
  }
  function appendchildrenBox(insertHTML){
    var childSelectHtml = '';
      childSelectHtml = `<div id="children">
                          <select id="children-select">
                            <option value="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`
    $("#select_children ").append(childSelectHtml);
  }
  function appendgrandchildrenBox(insertHTML){
    var garndchildSelectHtml = '';
      garndchildSelectHtml = `<div id="grandchildren">
                                <select id="grandchildren-select">
                                  <option value="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>`
    $("#select_children").append(garndchildSelectHtml)
  }

  $(document).on("change","#item_category_id",function(){
    var productcategory = document.getElementById("item_category_id").value;
      if (productcategory != '' ){
        $.ajax({
          url: "/items/children",
          type: "GET",
          data: {productcategory: productcategory},
          dataType: 'json'
        })
        .done(function(children){
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendchildrenBox(insertHTML);
          $(document).on("change","#item_category_id",function(){
            $("#children").remove();
            $("#grandchildren").remove();
          })
        })
        .fail(function(){
          alert("カテゴリー取得に失敗しました");
        })
      }
  });

  $(document).on("change","#children-select",function(){
    var childrencategory = document.getElementById("children-select").value;
    if ( childrencategory != ''){
      $.ajax({
        url: "/items/grandchildren",
        type: "GET",
        data: {productcategory: childrencategory},
        dataType: "json"
      })
      .done(function(grandchildren){
        var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendgrandchildrenBox(insertHTML);
          $(document).on("change","#children-select",function(){
            $("#grandchildren").remove();
          })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});

