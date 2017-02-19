
(library(shiny))
(library(threejs))



shinyUI(fluidPage(
  titlePanel("3D Graph of Random Numbers"),
    sidebarLayout(
      sidebarPanel(
        numericInput("numeric", "Please type in a random number between 1-100 to get another set of random points plotted on the 3D Graph?", value = 1, min = 1, max = 100, step =1),
        helpText("Click here for Documentation --> http://rpubs.com/jassalak/ThreeDGraph_RandomNumbers") 
         ),

  mainPanel(
      h3("3D Graph of Random Numbers"),
      uiOutput("ScatterPlot")
    )
  )
))