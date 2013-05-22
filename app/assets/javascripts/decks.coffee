$(document).on 'click', 'div.card', ->
  type = 'sideboard' if $(this).closest('.sideboard').length
  deck_id = $('.deck').attr('data-deck')
  $.ajax
    url: $('.deck').attr('data-url') + '/' + $(this).attr('data-id')
    data: { deck_id: deck_id, type: type }
    type: 'DELETE'
    dataType: 'script'
  $(this).hide()

$(document).on
  mousedown: (event) ->
    type = 'sideboard' if event.altKey
    deck_id = $(this).parent().parent().attr('data-deck')
    $.post $(this).parent().attr('data-url'),
      { id: $(this).attr('data-id'), deck_id: deck_id, type: type }
  mouseenter: ->
    image = "<img src='" + $(this).attr('data-image') + "'/>"
    $('.card-preview').html(image)
  mouseleave: ->
    $('.card-preview').html('')
  , '.mtgset > li.card'
