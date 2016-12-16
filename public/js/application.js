$(document).ready(function() {
  $("#login").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: "get",
      url: "/sessions/login"
    })

    .done(function(response){
      $("ul").append(response)
    })
  })

  $("#register").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: "get",
      url: "/users/new"
    })
    .done(function(response){
      $("ul").append(response)
    })
  })

  $(".ajea-container").on('submit', '.inline', function(event) {
    event.preventDefault();
    var action = $(event.target).attr('action')
    var method = $(event.target).attr('method')
    var dataStuff = $(event.target).serialize()
    $.ajax({
      url: action,
      method: method,
      data: dataStuff
    }).done(function(response){
      $('#' + response['id']).find('.points').text(response['vote_value']);
    })
  })

  $(".ajea-container").on('submit', '.delete', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(event.target).attr('action'),
      type: "delete"
    }).done(function(response){
      $('#' + response['id']).remove();
    })
  })
})
