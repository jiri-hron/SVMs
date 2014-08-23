source("./make.grid.R", local = TRUE)
source("./svm.fit.plot.R", local = TRUE)

library(shiny)
library(kernlab)
library(ggplot2)

theme_set(theme_minimal())
theme = theme_update(legend.position="top",
                     legend.title=element_blank(),
                     panel.grid.major.x=element_blank())

shinyServer(function(input, output) {
  output$svmPlot <- renderPlot({
    ## make server dependent on control button
    input$control_button
    
    ## if the control button was pressed, train svm and plot its results
    isolate({
      control_button = input$control_button
      
      x1_mean_a = input$x1_mean_a
      x2_mean_a = input$x2_mean_a
      x1_mean_b = input$x1_mean_b
      x2_mean_b = input$x2_mean_b
      std_a = input$std_a
      std_b = input$std_b
      method = input$method
      gauss_std =  input$gauss_std
      C = input$C
      seed = input$seed
      
      svm.fit.plot(x1_mean_a, x2_mean_a, x1_mean_b, x2_mean_b, std_a, std_b,
                   method, C, seed, gauss_std)
    })
  }, height = 600, width = 700)
  
})
