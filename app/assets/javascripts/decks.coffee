$(document).on 'click', 'div.card', ->
  type = 'sideboard' if $(this).closest('.sideboard').length
  deck_id = $('.deck-data').attr('data-deck')
  $.ajax
    url: $('.deck-data').attr('data-url') + '/' + $(this).attr('data-id')
    data: { deck_id: deck_id, type: type }
    type: 'DELETE'
    dataType: 'script'
  $(this).remove()

$(document).on
  mousedown: (event) ->
    type = 'sideboard' if event.altKey
    deck_id = $('.deck-data').attr('data-deck')
    $.post $('.deck-data').attr('data-url'),
      { id: $(this).attr('data-id'), deck_id: deck_id, type: type }
  mouseenter: ->
    image = "<img src='" + $(this).attr('data-image') + "'/>"
    $('.card-preview').html(image)
  mouseleave: ->
    $('.card-preview').html('')
  , '.mtgset > li.card'

ready = ->
  if $('#card_search').length > 0
    $('#card_search').autocomplete(
      source: '/search_cards'
      minLength: 3
      appendTo: ".results"
      select: (event, ui) ->
        type = 'sideboard' if event.altKey
        deck_id = $('.deck-data').attr('data-deck')
        $.post $('.deck-data').attr('data-url'),
          { id: 0, deck_id: deck_id, type: type, term: ui.item.value }
    ).data("autocomplete").close = (e) ->
      false

$(document).ready(ready)
$(document).on('page:load', ready)
