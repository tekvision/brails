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

AriaEvent = (element, max_row, max_col) ->
  @main_element = $(element)
  $(element).attr('tab-index', 0)
   
  @maxrow = max_row 
  @maxcol = 
  @keys = keyCodes
  $('#row_0_col_0').attr('tabindex', "0")
  console.log "In Left and right key are in progress"

AriaEvent.prototype.bindhandler = ()->
  thisObj = this
  $row_event = @main_element.find('.row[role="row"] .span3')
  $row_event.bind 'keyup', (e)->
    console.log "key up"
    thisObj.bind_grid_cell($(this), e)
  
  $row_event.bind 'keypress', (e)->
    console.log('key press 1')
    thisObj.bind_grid_cell($(this), e)
  
 
AriaEvent.prototype.bind_grid_cell = (id, e)->
  $curCell = id #Store the current cell object to prevent repeated DOM traversals 
  console.log "key code"
  console.log e.keyCode
  if e.ctrlKey == true || e.altKey == true || e.shiftKey == true  
    return true 
  #TOdo: Need Add dynamic keycode 
  switch e.keyCode
    when @keys.enter, @keys.f2
      # enter the edit mode for the cell 
      @enterEditMode $curCell
      e.stopPropagation
      return false
      break
    when 37
      $newCell = $curCell.prev()  
      $newCell.attr("tabindex", "0").focus() 
      e.stopPropagation
      return false
      break
    when 38
      break   
    when 39
      $newCell = $curCell.next()
      $newCell.attr("tabindex", "0").focus()
      $curCell.removeAttr("tabindex")
      break
$(document).ready ->
  app = new AriaEvent('#game-levels', $("#game-levels .row[role='row']").size(), 5)
  app.bindhandler()   
