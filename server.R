
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  signal.t = 0
  signal.phase <- 0.0
  signal.y <- 0

  
  output$signalPlot <- renderPlot({

    signal.t <- seq(0,30,0.01)
    signal.phase <- 0.0
    signal.y <- sin(2 * pi * signal.t * input$signalFrequency + signal.phase)

    plot(signal.t,signal.y,type='l',xlab='t',ylab='CPU Utilization %')
  })

  output$samplePlot1 <- renderPlot({
    phase = 0.0 
    t <- seq(0,2*pi,pi/64)
    phase <- 0.0
    y <- sin(2 * pi * t * (input$sampleFrequency1) + phase)
    
    plot(t,y,type='l',ylab='CPU Utilization %')

  })
  
  output$samplePlot2 <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$sampleFrequency2 + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  
  

})
