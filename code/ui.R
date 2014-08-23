library(shiny)

shinyUI(navbarPage("SVMs interactive",
  tabPanel("Plot",
  sidebarLayout(
    sidebarPanel(
      tags$div(title = "Set seed from 1 to 1073741824",
      numericInput("seed",
                   "Set seed",
                   12344,
                   min = 1,
                   max = 1073741824,
                   step = 1)
      ),
      tags$div(title = "Set mean value for first dimension of group A points",
      numericInput("x1_mean_a",
                   "Mean value for x1 (group A):",
                   2,
                   min = 0,
                   max = 7)
      ),
      tags$div(title = "Set mean value for second dimension of group A points",
      numericInput("x2_mean_a",
                   "Mean value for x2 (group A):",
                   2,
                   min = 0,
                   max = 7)
      ),
      tags$div(title = "Set mean value for first dimension of group B points",
      numericInput("x1_mean_b",
                   "Mean value for x1 (group B):",
                   4,
                   min = 0,
                   max = 7)
                   ),
      tags$div(title = "Set mean value for second dimension of group B points",
      numericInput("x2_mean_b",
                   "Mean value for x2 (group B):",
                   3,
                   min = 0,
                   max = 7)
                   ),
      tags$div(title = "Set standard deviation for both dimensions of group A points",
      sliderInput("std_a",
                  "Standard deviation for group A:",
                  1.4,
                  min = 0,
                  max = 2,
                  step = 0.1)
                  ),
      tags$div(title = "Set standard deviation for both dimensions of group B points",
      sliderInput("std_b",
                  "Standard deviation for group B:",
                  1.2,
                  min = 0,
                  max = 2,
                  step = 0.1)
                ),
      tags$div(title = "Bigger C means better fit on training data (more variance)",
      numericInput("C",
                   "Cost of margin violation:",
                   1,
                   min = 0.001,
                   max = 1000,
                   step = 0.001)
              ),
      tags$div(title = "Gaussian kernel for non-linear decision boundary",
      selectInput("method",
                  "Choose type of the kernel used:",
                  choices = list("Linear kernel" = "vanilladot",
                                 "Gaussian kernel" = "rbfdot"),
      )
      ),
      tags$div(title = "Bigger the deviation, more robust the fit (less variance)",
      conditionalPanel("input.method == 'rbfdot'",
                       sliderInput("gauss_std",
                                   paste("Standard deviation for",
                                         "Gaussian kernel:"),
                                   1,
                                   min = 0.1,
                                   max = 2,
                                   step = 0.01
                       )
              )
      ),
      actionButton("control_button",
                   "Train SVM")      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("svmPlot", width = "100%", height = "100%"),
      p("Please click on the ", em("Documentation"), paste("tab for basic", 
              "information about this application and instructions on",
              "how to use it."))
    )
  )),
  tabPanel("Documentation",
           includeHTML("../doc/documentation.html")
  )
))
