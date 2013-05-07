keyCodes = ->
  # Define values for keycodes 
  @backspace = 8
  @tab = 9
  @enter = 13
  @esc = 27
  @space = 32
  @pageup = 33
  @pagedown = 34
  @end = 35
  @home = 36
  @left = 37
  @up = 38
  @right = 39
  @down = 40
  @insert = 45
  @del = 46
  @f2 = 113 

AriaEvent = (element, max_row) ->
  @main_element = $(element)
  $(element).attr('tabindex', 0)
  @maxrow = max_row 
  @keys = keyCodes     
  console.log "In Left and right key are in progress"

AriaEvent.prototype.bindhandler = ()->
  thisObj = this
  $row_event = $(this).main_element().find('ul[role="row"]')
  $("#game-levels").bind 'keyup', (e)->
    alert(e)
    #thisObj.bind_grid_cell(object, e)
  
  #$row_event.bind 'keypress', (e)->
    #thisObj.bind_grid_cell(object, e


AriaEvent.prototype.bind_grid_cell = (id, e)->
  $curCell = $(id) #Store the current cell object to prevent repeated DOM traversals 
  #if e.ctrlKey == true || e.altKey == true || e.shiftKey == true || this.editMode == true 
    #return true 
  
  switch e.keyCode
    when @keys.enter, @keys.f2
      
      # enter the edit mode for the cell 
      alert("cell activated")
      #@enterEditMode $curCell
      e.stopPropagation
      return false
      break
    
    when @keys.left
      alert("you are moving left")
      #$newCell = $curCell.prev()
      
      #$newCell = $newCell.prev()  
      #$newCell.attr("tabindex", "0").focus() 
      e.stopPropagation
      return false
      break

#Siddhant Chothe: Just getting the basic keypress passed through to the javascript handling it not letting the screen reader's interpretation of keypress get in way.
#	For enhancing the following implementation, we can go to
#	http://test.cita.illinois.edu/aria/grid/grid1.php#lsc1

$(document).ready ->
  #app = new AriaEvent('#game-levels', $("#game-levels ul[role='row']").size())
  $("#grid-wrapper").keypress((e) ->
    switch e.keyCode
      when 37, 38, 39, 40 #got error for keyCodes.up and others
        alert("Moving with arrow keys and screen reader doesn't interupt! :)")
  )
