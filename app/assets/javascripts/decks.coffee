$(document).on 'click', '.mtgset > li.card', ->
  deck_id = $(this).parent().parent().attr('data-deck')
  $.post $(this).parent().attr('data-url'),
    { id: $(this).attr('data-id'), deck_id: deck_id }

$(document).on 'click', '.card', ->
  deck_id = $('.deck').attr('data-deck')
  $.ajax
    url: $('.deck').attr('data-url') + '/' + $(this).attr('data-id')
    data: { deck_id: deck_id }
    type: 'DELETE'
    dataType: 'script'
  $(this).hide()
