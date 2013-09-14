# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  $(document).ready ->
    errorElements = $('.content').find('.help-inline').prev()
    ul = $('<ul id="errorlist"></ul>')
    errorElements.each (i) ->
      span = $(this).next()
      labelText = $(this).parent().parent().find('label')
      $(' <li id="will"> <a href="#' + $(this).attr('id') + '" class="errorlink" >' + labelText.text() + ' ' + '(' + span.text() + ')' + '</a></li>').appendTo(ul)
    $('.errorlink').click ->
     alert('hello')

    $('#errorcontainer').html(ul)

    $(".errorlink").bind "click", (e) ->
      alert('hello')

    window.nestedFormEvents.insertFields = (content, assoc, link) ->
      $(content).insertBefore(link)
      if assoc == "contents"
        $('.more_content').html('Add More Content')
      else if assoc == "questions"        
        $('.more_question').html('Add More Questions')
      else if assoc == "options"
        $('.more_options').html('Add More Options')      
    audio_file = $("audio")[0];
    new MediaElement(audio_file,
        loop: true
        pauseOtherPlayers: true
        features: [ "playpause", "progress", "current", "duration", "tracks", "volume", "fullscreen" ]
        success: (media) ->
          console.log 'Successfull'
        error: (e) -> 
          console.log 'Error'
    )
