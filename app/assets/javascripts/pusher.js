$(document).ready(function(){
  $("#new_message").submit(function(){
    $.post($(this).attr("action"), $(this).serialize());
    $("#message_body").val("");
    return false;
  });

  var pusher = new Pusher(window.PUSHER_KEY);
  var channel = pusher.subscribe(window.PUSHER_CHANNEL);
  channel.bind("send_message", function(data) {
    $("#messages").append(data.message_html);
    scrollbar();
  });
});
