// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function remove_fields(link) {
  $(link).closest(".fields").remove();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

