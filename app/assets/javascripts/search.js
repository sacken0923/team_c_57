$(function() {
  function buildChildHTML(child){
    // var html =`<a class="child_category" id="${child.id}" 
    //             href="/category/${child.id}">${child.name}</a>`;
    var html = `<div class="saku-category child_category" id="${child.id}">
                  ${child.name}
                </div>`
    return html;
  }
  $(".saku-category").on("mouseover", function() {
    var id = this.id
    $(".saku-category").removeClass("selected-red")
    $('#' + id).addClass("selected-red");
    $(".child_category").remove();
    $(".grand_child_category").remove();
    $.ajax({
      type: 'GET',
      url: '/category/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html = buildChildHTML(child);
        $(".children_list").append(html);
      })
    });
  });
  function buildGrandChildHTML(child){
    var html = `<div class="saku-category grand_child_category" id="${child.id}">
                  ${child.name}
                </div>`
    return html;
  }

  $(document).on("mouseover", ".child_category", function () {
    var id = this.id
    $(".selected-gray").removeClass("selected-gray");
    $('#' + id).addClass("selected-gray");
    $.ajax({
      type: 'GET',
      url: '/category/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".grand_children_list").append(html);
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });
    });
  });  
});

$(document).on("mouseover", ".header-category__search", function () {
    $(".header-category__list").removeClass("hidden-categories");
  });
  
$(document).on("mouseleave", ".header-category__search", function(){
  $(".header-category__list").addClass("hidden-categories");
});
