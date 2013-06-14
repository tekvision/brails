$(document).ready ->
  $("#audio").bind "ended", ->
    $('#summary').show()
  $('audio').mediaelementplayer();

      


