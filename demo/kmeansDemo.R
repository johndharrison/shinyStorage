library(shinyStorage)
library(shiny)
library(RJSONIO)
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
runApp(
  list(ui = pageWithSidebar(
    headerPanel('Iris k-means clustering'),
    sidebarPanel(
      addSS(),
      uiOutput('testUI')
    ),
    mainPanel(
      plotOutput('plot1')
    )
  )
  , server = function(input, output, session){
    ss <- shinyStore(session = session)
    selectedData <- reactive({
      iris[, c(input$xcol, input$ycol)]
    })
    clusters <- reactive({
      kmeans(selectedData(), input$clusters)
    })
    output$plot1 <- renderPlot({
      par(mar = c(5.1, 4.1, 0, 1))
      plot(selectedData(),
           col = clusters()$cluster,
           pch = 20, cex = 3)
      points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
    output$testUI <- renderUI({
      myVar <- ss$get("myVar")
      if(is.null(myVar)){
        tagList(
          selectInput('xcol', 'X Variable', names(iris)),
          selectInput('ycol', 'Y Variable', names(iris),
                      selected=names(iris)[[2]]),
          numericInput('clusters', 'Cluster count', 3,
                       min = 1, max = 9)
        )
      }else{
        myVar <- fromJSON(myVar)
        tagList(
          selectInput('xcol', 'X Variable', names(iris), selected = myVar$xcol)
          selectInput('ycol', 'Y Variable', names(iris), selected = myVar$ycol),
          numericInput('clusters', 'Cluster count', myVar$clusters,
                       min = 1, max = 9)
        )
      }
    })
    
    observe({
      myList <- list(xcol = input$xcol, ycol = input$ycol, clusters = input$clusters)
      ss$set("myVar", myList)
    })
    
  })
)

