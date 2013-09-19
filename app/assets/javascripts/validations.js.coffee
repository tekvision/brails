# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  $(document).ready ->
#    alert("hello")
    #error elements test
    #alert("error elements:" + $('.content:first .help-inline').size())
    #get the errorElements
    errorElements = $(document).find('.help-inline')

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
          alert("hello")
          $("#" + inputElement.attr("id")).focus()

        #listElement for anchor element
        listElement = $(document.createElement("li"))
        errorSummaryContainer.append(listElement)
        listElement.append(anchorElement)


      #End iteration
      $(".errorlink:first").focus()
