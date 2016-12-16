$(document).ready(function() {
  $(".ajea-container").on('submit', '.inline', function(event) {
    event.preventDefault();
    $.ajax({
      action: $(event.target).attr('action'),
      method: $(event.target).attr('method'),
      data: $(event.target).serialize()
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
});
