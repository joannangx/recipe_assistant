$(document).ready(function() {
	$('.pages').hide();
});

$(document).ready(function show_page() {
	$('.link').on('click', function() {
    var div;
    if ($(this).data("page") == "recipe") {
      div = "#recipe_"
    } else if ($(this).data("page") == "ingredients") {
      div = "#ingredients_"
    } else if ($(this).data("page") == "directions") {
      div = "#directions_"
    } else {
      div = "#new_page"
    }
    div += $(this).data("id");
		$(div).slideDown(300);
    $('.back_div').hide();
    $('.back').hide();
    $('.back').show(300);
    $('.back_div').show(300);
    $('.index_page').hide();
	});
});

$(document).ready(function hide_page() {
  $('.back').on('click', function() {
    $('.index_page').show();
    $(this).hide(50);
    $(this).parent().parent().slideUp(300);
  });
});

