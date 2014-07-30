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
});
