library(shiny)

ui <- fluidPage(
  titlePanel("Calculate Bodyfat!"),

  numericInput("num1", "ADIPOSITY", 23.5),
  numericInput("num2", "NECK", 38.5),
  numericInput("num3", "ABDOMEN", 85.0),
  numericInput("num4", "HIP", 100.0),
  numericInput("num5", "BICEPS", 30.0),
  numericInput("num6", "WRIST", 18.5),

  actionButton("submit", "Calculate Bodyfat!"),

  verbatimTextOutput("result")
)


server <- function(input, output, session) {
  observeEvent(input$submit, {
    bodyfat <- 0.37496332*input$num1 - 0.56563415*input$num2 + 
      0.79858893*input$num3 - 0.29886789*input$num4 + 
      0.23762448*input$num5 - 1.71562625*input$num6 + 
      10.718498170714692
    rounded_bodyfat <- round(bodyfat, 1)
    output$result <- renderText({
      paste("Bodyfat:", rounded_bodyfat)
    })
  })
}


shinyApp(ui = ui, server = server)