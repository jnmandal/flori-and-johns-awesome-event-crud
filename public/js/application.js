$(document).ready(function() {
  $(".edit_form").hide();
  $(".delete_button").on("click", function() {
    var event_id = $(this).closest("tr").attr("id");
    var request = $.ajax({
      url: "/events/"+event_id,
      method: "delete"
    });
    request.done(function(){
      $("tr#"+event_id).remove();
    });
  });

  $(".edit_button").on("click", function(){
    var table_row = 1;
    var event_id = $(this).closest("tr").attr("id");

  });

});
