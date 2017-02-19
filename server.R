
(library(shiny))
(library(threejs))


shinyServer(function(input, output) {
  
  output$ThreeD_plot_1 <- renderScatterplotThree({
    set.seed(2222)
    
    number_of_points <- input$numeric 
    
 
    
    dataX <- runif(number_of_points, 0, 100)
    dataY <- runif(number_of_points, 0, 100)
    dataZ <- runif(number_of_points, 0, 100)
    

    scatterplot3js(dataX, dataY, dataZ, color = rainbow(number_of_points), flip.y = FALSE)
    
  })
  output$ScatterPlot <- renderUI({
    scatterplotThreeOutput("ThreeD_plot_1")
})
})