library(shiny)

source("C:/Users/19010/Desktop/DevEng 203/week 2/studypower/man/study power.R")

shinyServer(function(input, output) {
  observeEvent(input$calculateButton, {
    result <- sample_size(
      power = input$power,
      significance = input$significance,
      mde = input$mde,
      var = input$variance
    )
    output$resultText <- renderText({
      paste("Calculated Sample Size: ", result)
    })
  })
})