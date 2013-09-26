# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  window.nestedFormEvents.insertFields = (content, assoc, link) ->
    $(content).insertBefore(link)
    if assoc == "questions"
      $('.more_question').html('Add More Bonus Round Questions')
    else if assoc == "options"        
      $('.more_option').html('Add More Options')
  

