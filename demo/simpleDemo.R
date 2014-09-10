library(shinyStorage)
library(shiny)

runApp(
  list(
    ui = fluidPage(
      addSS(),
      uiOutput("textExample")
      )
    , server = function(input, output, session){
      ss <- shinyStore(session = session)
      output$textExample <- renderUI({
        myVar <- ss$get("myVar")
        if(is.null(myVar)){
          textInput("textID", "Add some text to local storage")
        }else{
          textInput("textID", "Add some text to local storage", myVar)          
        }
      })
      
      observe({
        if(!is.null(input$textID)){
          if(input$textID != ""){
            ss$set("myVar", input$textID)
          }
        }
      })
    }
    )
  )