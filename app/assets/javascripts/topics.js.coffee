  $(document).ready ->
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
