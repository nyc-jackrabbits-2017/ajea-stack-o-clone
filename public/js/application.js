$(document).ready(function() {
  $("#login").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: "get",
      url: "/sessions/login"
    })
    .done(function(response){
      $("#login").html(response)
    })
  })

  $("#register").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: "get",
      url: "/users/new"
    })
    .done(function(response){
      $("#register").html(response)
    })

  })
});
