# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  $(document).ready ->

    
    $realInputField = $('.content').find('input:file')
    $realInputField.bind 'change', (e)->
      $audioFileName = $(this).parent().prev()
      $audioFileName.val($(this).val())

    $(document).on "nested:fieldAdded", (e) ->  
      $realInputField = $('.content').find('input:file')
      $realInputField.bind 'change', (e)->
        $audioFileName = $(this).parent().prev()
        $audioFileName.val($(this).val())

    errorElements = $('.content').find('.help-inline').prev()
    ul = $('<ul id="errorlist"></ul>')
    errorElements.each (i) ->
      span = $(this).next()
      labelText = $(this).parent().parent().find('label')
      $(' <li> <a href="#' + $(this).attr('id') + '" class="errorlink" >' + labelText.text() + ' ' + '(' + span.text() + ')' + '</a></li>').appendTo(ul)
    $('#errorcontainer').html(ul)
    $('.errorlink').bind 'click', (e)->
      sid = $(this).attr('href').substr(1, $(this).attr('href').length-1)
      e.stopPropagation
      $('input[id="' + sid + '"]').focus()

    window.nestedFormEvents.insertFields = (content, assoc, link) ->
      $(content).insertBefore(link)
      if assoc == "contents"
        $('.more_content').html('Add More Content')
      else if assoc == "questions"        
        $('.more_question').html('Add More Questions')
      else if assoc == "options"
        $('.more_options').html('Add More Options')      
    
    
