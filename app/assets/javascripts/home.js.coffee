$(document).ready ->
  $("#audio").bind "ended", ->
    $('#summary').show()
  $('audio').mediaelementplayer();


  # color switcher
  $(".color-switcher .switch").on "click", ->
    t = $(this)
    color = t.data("color")
    $('html').removeClass("white yellow orange black").addClass(color);

      


