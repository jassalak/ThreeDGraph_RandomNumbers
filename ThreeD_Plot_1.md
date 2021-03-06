3D Graph of Random Numbers
========================================================
author: jassalak
date: Feb. 19, 2017
autosize: true

Goal & Instructions
========================================================

The goal for this project is to utilize a 3D Scatterplot and distribute via an URL.  

How to Use The Report:
* Type in any number between 1-100.  
* The graph on the right side will plot points, this is somewhat random as well
* Click/Move mouse around on the graph for maximum enjoyment

Slide With Code (ui.R)
========================================================


```r
(library(shiny))
(library(threejs))
shinyUI(fluidPage(
  titlePanel("3D Graph of Random Numbers"),
    sidebarLayout(
      sidebarPanel(
        numericInput("numeric", "Please type in a random number between 1-100 to get another set of random points plotted on the 3D Graph?", value = 1, min = 1, max = 100, step =1)
       ),
  mainPanel(
      h3("3D Graph of Random Numbers"),
      uiOutput("ScatterPlot")
    )
  )
))
```

Slide With Code (server.R)
========================================================


```r
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
```

External Links and Disclaimers
========================================================

This is the link to the URL hosted on Shiny.io --> https://jassalak.shinyapps.io/RandomPoints_3DGraph/

Disclaimer: I originally created the 3D Scatterplot using the shinyRGL package.  This package was more straightforward and had more customization (like sliders for min/max axes).  Unfortunately, there was an error publishing to Shiny.io.  Others have experienced this error as well and there no fix I could implement.  With this said, I used the threejs package and while I did lose customization aspects, it did work.  

