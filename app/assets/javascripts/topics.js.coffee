# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  $(document).ready ->


    #error elements test
    #alert("error elements:" + $('.content:first .help-inline').size())
    #get the errorElements
    errorElements = $('.content:first .help-inline')

    #validate only if errors exist
    if(errorElements.length > 0)
      #test where error container is
      #$("#errorcontainer").html("Here I am")

      #ul element as container for error summary
      errorSummaryContainer = $(document.createElement("ul"))
      errorSummaryContainer.attr("id","errorlist")

      #append error summary to error container
      $("#errorcontainer").append(errorSummaryContainer)

      #Iterate through the error elements to create summary
      #test individual error elements
      #i = 0
      errorElements.each ->
        #Test results for each individual error element
        #alert("this is error number " + ++i)

        #individual participents
        errorElement = $(this)#Note this singular
        inputElement = errorElement.prev()#preventing another call to $(this)
        labelElement = errorElement.parent().prev()#again preventing another call to $(this)

        #test whether we have all the above three elements
        #alert(labelElement.text() + ":" + labelElement.attr("for") + ":" + inputElement.attr("id") + ":" + errorElement.text())
        #test to get only label text without the "*" sign
        #alert(labelElement.contents().last().text())

        #Error string
        labelText = labelElement.contents().last().text()#without the "*"
        errorString = labelText + "(" + errorElement.text() + ")"#e.g. First Name(Can't be blank)

        #anchor element for error string
        anchorElement = $(document.createElement("a"))
        #Siddhant thinks that focussing input element can work even without the href in action
        anchorElement.attr("href","javascript:void(0)")
        anchorElement.addClass("errorlink")
        anchorElement.text(errorString)
        anchorElement.click ->
          $("#" + inputElement.attr("id")).focus()

        #listElement for anchor element
        listElement = $(document.createElement("li"))
        errorSummaryContainer.append(listElement)
        listElement.append(anchorElement)

      #End iteration

      #focus the first anchor of errors and announce the same to screen reader user
      $(".errorlink:first").focus()
      #Still need javascript statements to generate a hidden element with ARIA alert/asert/whatever
      #that tells "There are errors. you are on first error. Press tab and shift tab to move between errors. Hit enter to resolve it."

    #End if errors


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
