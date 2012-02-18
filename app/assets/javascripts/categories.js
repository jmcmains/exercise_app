// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function modHighlight(main,showDesc,desc) {
  $("div.sidebar h2").removeClass("highlight");
  if (showDesc) {
  	$("div.descbar").show();
		$("div.exercises").css("top","150px");
		$("div.descbar").html(desc);
  } else {
		$("div.descbar").hide();
		$("div.exercises").css("top","0px");
	}
	$(this).addClass("highlight");
	$("table.exercises").html(main);
};
