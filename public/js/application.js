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
    var table_row = $(this).closest("tr")
    var event_id = $(this).closest("tr").attr("id");
    table_row.toggle();
    $(this).parent().parent().next('.edit_form').toggle();
  });

  $(".update_button").on("click", function() {
    var event_id = $(this).closest("tr").prev().attr("id")
    var table_row = $(this).closest("tr")
    var request = $.ajax({
      url: "/events/"+event_id,
      method: "put",
      data: $(this).parent().siblings().children().serialize()
    })
    request.done(function(response) {
      table_row.prev().children().eq(0).html(response.title)
      table_row.prev().children().eq(1).html(response.location)
      table_row.prev().children().eq(2).html(response.date)
      table_row.toggle();
      table_row.prev().toggle();
    })

  })

});
