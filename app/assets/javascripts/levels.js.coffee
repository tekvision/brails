# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  $(document).ready ->
    errorElements = $('.content').find('.help-inline').prev()
    ul = $('<ul id="errorlist"></ul>')
    errorElements.each (i) ->
      span = $(this).next()
      labelText = $(this).parent().parent().find('label')
      $(' <li> <a href="#' + $(this).attr('id') + '" onclick=" " >' + labelText.text() + ' ' + '(' + span.text() + ')' + '</a></li>').appendTo(ul)
    $('#errorcontainer').html(ul)

$("#bonus_round_unlocked").click ->
  $("#bonus_round").show()
