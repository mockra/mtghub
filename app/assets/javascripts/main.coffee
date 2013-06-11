ready = ->
  $('.nav-links .btn.profile').tooltip
    placement: 'bottom'
    title: 'Profile'
  $('.nav-links .btn.deck').tooltip
    placement: 'bottom'
    title: 'New Deck'
  $('.nav-links .btn.settings').tooltip
    placement: 'bottom'
    title: 'Settings'
  $('.nav-links .btn.logout').tooltip
    placement: 'bottom'
    title: 'Log Out'
  $('.nav-links .btn.login').tooltip
    placement: 'bottom'
    title: 'Log In'
  $('.best_in_place').best_in_place()

$(document).on 'click', '.comment a.comment-delete', ->
  $(this).parents('.comment').remove()

$(document).ready(ready)
$(document).on('page:load', ready)
