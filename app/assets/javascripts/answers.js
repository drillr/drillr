$(document).ready(function() {
  $("#use-hint").on("click", function() {
    console.log("clicked on use-hint");
    // use ajax to get the hint from the server, callback will:
    // display the hint:
    // hide the 'hint' button
    // change the hidden field to true
    $.ajax({
      url: window.location.href + ".json",
      success: function(data){
        var hint = data.hint;
        $("#hint-show").children(".panel-body").html(hint);
        $("#hint-show").slideDown();
        $("#use-hint").fadeOut();
        $("#answer_used_hint").val("true");
      },

      error: function() {
        alert("Couldn't get hint, sorry!");
      }

    });

  });
});
