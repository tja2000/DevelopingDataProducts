#
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyUI(
  fluidPage(

    headerPanel("TEST")    ,
     fluidRow(
        column(width=4,sliderInput("pointSize", "Point size:", min=1, max=8, value=1)),
        column(width=6,sliderInput("plotWidth", "Width of the plot:", min=400, max=1000, value=50))
        ),
     
      fluidRow(
         column(width = 6,h4("Click on a data point or select multiple"), uiOutput("plot.ui"))
     ),

     fluidRow(
      column(width = 6, h4("Selected car:"),verbatimTextOutput("click_info")),
      column(width = 6, h4("Selected cars ordered per mpg:"), verbatimTextOutput("brush_info"))
    )
  )
)