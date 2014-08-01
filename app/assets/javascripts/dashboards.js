function scrollToBottom(){
  $(".messages").scrollTop($(".messages")[0].scrollHeight);
}

$(document).ready(function(){
  $(".toggle-comments").click(function(event){
    event.preventDefault();
    $(".comments-dashboard").toggle();
  });

  $("#new_comment").on("submit", function(event){
    $.post(
      $(this).attr("action"),
      $(this).serialize()
    ).done(function(html){
      $(".comments-dashboard").prepend(html);
      $("#comment_body").val("");
    });
  return false;
  });

  $(".thought-comment").on("submit", function(event){
    var thoughtId = $(this).data("thought-id");

    $.post(
      $(this).attr("action"),
      $(this).serialize()
    ).done(function(html){
      $("#thought-comments-dashboard-"+thoughtId).append(html);
      $("#comment_body").val("");
    });

    return false;
  });
});
