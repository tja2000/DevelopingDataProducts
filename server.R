
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
mtcars2 <- mtcars[, c("mpg", "cyl", "disp", "hp", "wt", "am", "gear")]

shinyServer(function(input, output) {
  
  output$plot1 <- renderPlot(
    {
    ggplot(mtcars2, aes(wt, mpg)) + geom_point(aes(colour = factor(cyl)),size=input$integer)
    }
  )
  
  output$click_info <- renderPrint({
    nearPoints(mtcars2, input$plot1_click)
  })
  
  output$brush_info <- renderPrint({
    brushedPoints(mtcars2, input$plot1_brush)
  })
})
