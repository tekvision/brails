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
   
  @maxrow = Number(max_row)
  @maxcol = Number(max_col)
  @keys = keyCodes
  $('#row_0_col_0').attr('tabindex', "0")
  console.log "In Left and right key are in progress"

AriaEvent.prototype.bindhandler = ()->
  thisObj = this
  $row_event = @main_element.find('.row ul.thumbnails[role="row"] .span3')
  console.log "aaaa"
  $row_event.bind 'keyup', (e)->
    console.log "key up"
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
    when 37 #left key 
      $newCell = $curCell.prev()
      if $newCell.length  
        $newCell.attr("tabindex", "0").focus() 
      else
        row_number = $curCell.attr('id').split('_')[1] 
        col_number = $curCell.attr('id').split('_')[3]
        if row_number > 0
          new_row_number = Number(row_number) - 1
          $newCell = $("#row_#{new_row_number}_col_#{@maxcol-1}")
          $newCell.attr("tabindex", "0").focus() 
        else
          col_count_last_row = $("#row_index_#{@maxrow - 1} .thumbnails").children('li.span3').size() - 1 
          $newCell = $("#row_#{@maxrow - 1}_col_#{col_count_last_row}")
          console.log $newCell
          $newCell.attr("tabindex", "0").focus()
       
      $curCell.removeAttr("tabindex")
      e.stopPropagation
      return false
      break
    when 38 #Up key
      row_number = $curCell.attr('id').split('_')[1] 
      col_number = $curCell.attr('id').split('_')[3]
 
      prev_cell =  $curCell.closest('.row').prev()
      if prev_cell.length  
        $newCell = prev_cell.find(".thumbnails li#row_#{row_number-1}_col_#{col_number}")   
        if $newCell.length == 0
          $newCell = prev_cell.find(".thumbnails li.span3").last()  
        $newCell.attr("tabindex", "0").focus()
        $curCell.removeAttr("tabindex")
      else
        next_cell = $curCell.closest('.row').next()
        console.log next_cell
        if next_cell.length
          $newCell = prev_cell.find(".thumbnails li#row_#{row_number+1}_col_#{col_number}")   
          if $newCell.length == 0
            $newCell = prev_cell.find(".thumbnails li.span3").last()  
          $newCell.attr("tabindex", "0").focus() 
          $curCell.removeAttr("tabindex")
      e.stopPropagation
      return false
      break   
    when 39 #right key
      $newCell = $curCell.next()
      if $newCell.length
        $newCell.attr("tabindex", "0").focus()
      else
        row_number = $curCell.attr('id').split('_')[1] 
        col_number = $curCell.attr('id').split('_')[3]
        console.log "max row"
        console.log @maxrow
        console.log row_number
        if row_number < (@maxrow - 1)
          console.log "inside if "
          new_row_number = Number(row_number) + 1
          $newCell = $("#row_#{new_row_number}_col_0")
          $newCell.attr("tabindex", "0").focus()
        else
          $newCell = $('#row_0_col_0') 
          $newCell.attr("tabindex", "0").focus()   
      
      $curCell.removeAttr("tabindex")
      e.stopPropagation
      break
    
    when 90 #down
       
      e.stopPropagation
      break
$(document).ready ->
  app = new AriaEvent('#game-levels', $("#game-levels .row").size(), 5)
  
  $('#row_0_col_0').attr('tabindex', "0")
  app.bindhandler()   
