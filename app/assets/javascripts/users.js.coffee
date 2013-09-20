errorElements = $(document).find('.help-inline').prev()
ul = $('<ul id="errorlist"></ul>')
errorElements.each (i) ->
  span = $(this).next()
  labelText = $(this).parent().parent().find('label')
  $(' <li> <a href="#' + $(this).attr('id') + '" onclick=" " >' + labelText.text() + ' ' + '(' + span.text() + ')' + '</a></li>').appendTo(ul)  
$('#profile').html(ul)
