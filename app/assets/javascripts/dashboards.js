$(document).ready(function(){
  $(".toggle-comments").click(function(event){
    event.preventDefault();
    $(".comments-dashboard").toggle();
  });
});
