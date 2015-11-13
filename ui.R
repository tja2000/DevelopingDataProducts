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
    
         fluidRow(
           column(width=6 , 
                  sliderInput("integer", "Point size:", min=1, max=8, value=1)
               )
         ),
     fluidRow(
        column(width = 4,
             plotOutput("plot1", height = 400, width=400,
                        click = "plot1_click",
                        brush = brushOpts(id = "plot1_brush"))
            )
    ),
    fluidRow(
      column(width = 6,
             h4("Data points near click"),
             verbatimTextOutput("click_info")
      ),
      column(width = 6,
             h4("Selected (brushed) points"),
             verbatimTextOutput("brush_info")
      )
    )
  )
)