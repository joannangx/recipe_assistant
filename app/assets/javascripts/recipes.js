$(document).ready(function() {
	$('.recipe_pages').hide();
	$('.ingredients_pages').hide();
  $('.directions_pages').hide();
});

$(document).ready(function show_page() {
	$('.link').on('click', function() {
    var div;
    if ($(this).data("page") == "recipe") {
      div = "#recipe_"
    } else if ($(this).data("page") == "ingredients") {
      div = "#ingredients_"
    } else {
      div = "#directions_"
    }
    div += $(this).data("id");
		$('.index_page').hide();
		$(div).slideDown(300);
	});
});