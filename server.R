
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plyr)
mtcars2 <- mtcars[, c("mpg", "cyl", "disp", "hp", "wt", "am", "gear")]

shinyServer(function(input, output) 
  {

    output$plot.ui <- renderUI(
      # Render the plot with the selected width and brush size.
      {
        plotOutput("plot", 
                   width = input$plotWidth, 
                   height=400,
                   click = "plot_click",
                   brush = brushOpts(id = "plot_brush"))
      }
    )

    output$plot <- renderPlot(
      # Create the plot object.
      {
        ggplot(mtcars2,
               aes(disp, mpg)) + geom_point(aes(colour = factor(cyl)),
               size=input$pointSize)
      }
    )

    output$click_info <- renderPrint(
      # Click on a single dot
      {
      nearPoints(mtcars2, input$plot_click)
      }
    )
    output$brush_info <- renderPrint(
      # Selected multiple dots
      {
        brushedPoints(mtcars2[order(-mtcars2$mpg),], input$plot_brush)
      }
    )
  }
)
