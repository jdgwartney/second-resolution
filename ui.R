
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Why One Second Matters?"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(position="right",
    sidebarPanel(
      sliderInput("signalFrequency",
                  "Signal Frequency (hz):",
                  min = 1/30,
                  max = 1,
                  value = 0.5),
      sliderInput("sampleFrequency1",
                  "Sample Frequency (hz) #1",
                  min = 1,
                  max = 300,
                  value = 60),
      sliderInput("sampleFrequency2",
                  "Sample Frequency (hz) #2",
                  min = 1,
                  max = 300,
                  value = 60)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("signalPlot"),
      plotOutput("samplePlot1"),
      plotOutput("samplePlot2")
    )
  )
))
