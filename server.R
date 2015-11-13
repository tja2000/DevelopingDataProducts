
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
mtcars2 <- mtcars[, c("mpg", "cyl", "disp", "hp", "wt", "am", "gear")]

shinyServer(function(input, output) 
  {
#     output$plot1 <- renderPlot(
#       {
#         ggplot(mtcars2,aes(wt, mpg)) + 
#               geom_point(aes(colour = factor(cyl)),size=input$pointSize)
#       }
#     )
  
   output$plot.ui <- renderUI(
      {
        plotOutput("plot", 
                   width = input$plotWidth, 
                   height=400,
                   click = "plot_click",
                   brush = brushOpts(id = "plot_brush"))
      }
    )

    output$plot <- renderPlot(
           {
             ggplot(mtcars2,aes(wt, mpg)) + 
                   geom_point(aes(colour = factor(cyl)),size=input$pointSize)
           }
         )

    output$click_info <- renderPrint(
      {
        nearPoints(mtcars2, input$plot_click)
      }
    )
    output$brush_info <- renderPrint(
      {
        brushedPoints(mtcars2, input$plot_brush)
      }
    )
  }
)
