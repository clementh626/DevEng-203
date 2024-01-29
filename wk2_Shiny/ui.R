library(shiny)

shinyUI(fluidPage(
  titlePanel("Sample Size Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("power", "Power:", 0.8, min = 0, max = 1, step = 0.01),
      numericInput("significance", "Significance level:", 0.05, min = 0, max = 1, step = 0.01),
      numericInput("mde", "Minimum Detectable Effect:", 0.5, min = 0, max = 10, step = 0.1),
      numericInput("variance", "Variance:", 1, min = 0, max = 100, step = 0.1),
      actionButton("calculateButton", "Calculate")
    ),
    
    mainPanel(
      verbatimTextOutput("resultText")
    )
  )
))