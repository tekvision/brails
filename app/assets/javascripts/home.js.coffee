$(document).ready ->
  $("#audio").bind "ended", ->
    $('#summary').show()
  $('audio').mediaelementplayer();

  # color switcher
  $(".color-switcher .switch").on "click", ->
    t = $(this)
    color = t.data("color")
    $('html').removeClass("white yellow orange black").addClass(color);

     
  body = $('body')
  max = 1425
  min = 425
  $(".btn-change-font-size").on "click", ->
    t = $(this)
    size = t.data("size")
       
    currentTextClass = parseInt(body.attr("class").split("textsize-")[1])

    console.log currentTextClass
    $("body").removeClass (index, css) ->
      (css.match(/\btextsize-\S+/g) or []).join " "

    if size is 'reset'
      body.addClass 'textsize-625'
      return   

    if size is 'up' 
      if currentTextClass isnt max
        body.addClass 'textsize-' + (currentTextClass + 200)
      else
        body.addClass 'textsize-' + max
    else if size is 'down' 
      if currentTextClass isnt min
        body.addClass 'textsize-' + (currentTextClass - 200)
      else
        body.addClass 'textsize-' + min




