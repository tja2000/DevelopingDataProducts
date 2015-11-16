#
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

txtTitle <- "The car selector app"
txtPointsize <- "Point size:"
txtWidth <- "Width of the plot:"
txtGraph <- "Click on a data point or select multiple points"
txtCar <- "Selected car:"
txtCars <- "Selected cars by mpg:"
txtHelpButton <- "Show help & Info"
txtHelp <- paste("Welcome to <b>",txtTitle,"</b>.",
"<p><span>This application lets you zoom in on different cars and get their info.</span></p>
<p><span>On the top you have two sliders that you
can use to manipulate the graph. The first one resizes the dots, the second one
the width of the graph. The different colors denote the number of cylinders in
the car. Displacement is the size of the engine in cubic inch. On the left you
can find the miles per gallon, more is economic.</span></p>
<p><span>Click on a dot to get info on the car, it
will be display in the left column under “Selected car:”.</span></p>
<p><span>If you drag your mouse on the graph you can
select multiple cars, they are displayed under “Selected cars ordered by MPG”.</span></p>
<p><span>The code can be found at <a href='https://github.com/tja2000/DevelopingDataProducts'
 target='null'>GitHub.</a></span></p>
")

shinyUI(
  fluidPage(
    titlePanel(txtTitle),
      fluidRow(
        # The two sliders
        column(width=4,sliderInput("pointSize", txtPointsize, min=1, max=8, value=1)),
        column(width=6,sliderInput("plotWidth", txtWidth, min=400, max=1000, value=50))
      ),
     
      fluidRow(
        # The graph
        column(width = 6,h4(txtGraph), uiOutput("plot.ui"))
      ),

      fluidRow(
        # The two results, for a single car or multiple
         column(width = 6, h4(txtCar),verbatimTextOutput("click_info")),
         column(width = 6, h4(txtCars),verbatimTextOutput("brush_info"))
       ),
      
      # Show help text if checked.
      checkboxInput("help", txtHelpButton, value = TRUE),
      conditionalPanel(
        condition="input.help==1",
        fluidRow(column(width=12, 
                         h2("Help and information"),
                         HTML(txtHelp)
                         )
                )
    )
  )
)