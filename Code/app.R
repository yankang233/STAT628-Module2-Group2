library(shiny)

# 定义合理范围
adiposity_range <- c(5, 40)
neck_range <- c(20, 50)
chest_range <- c(60, 120)
hip_range <- c(70, 150)
biceps_range <- c(20, 60)
wrist_range <- c(10, 25)

ui <- fluidPage(
  useShinyFeedback(),
  titlePanel("Calculate Bodyfat!"),
  
  numericInput("num1", "Adiposity (BMI)", 23.5),
  numericInput("num2", "Neck circumference (cm)", 38.5),
  numericInput("num3", "Chest circumference (cm)", 85.0),
  numericInput("num4", "Hip circumference (cm)", 100.0),
  numericInput("num5", "Biceps (extended) circumference (cm)", 30.0),
  numericInput("num6", "Wrist circumference (cm)", 18.5),
  
  actionButton("submit", "Calculate Bodyfat!"),
  
  verbatimTextOutput("result"),
  HTML('<p style="font-size:12px; color:grey;">If you have any question, please contact: jlu@wisc.edu</p>')
)

server <- function(input, output, session) {
  observeEvent(input$submit, {
    
    # 检查输入是否在合理范围内并显示警告
    feedbackWarning("num1", input$num1 < adiposity_range[1] || input$num1 > adiposity_range[2],
                    paste("Adiposity should be between", adiposity_range[1], "and", adiposity_range[2]))
    
    feedbackWarning("num2", input$num2 < neck_range[1] || input$num2 > neck_range[2],
                    paste("Neck circumference should be between", neck_range[1], "and", neck_range[2]))
    
    feedbackWarning("num3", input$num3 < chest_range[1] || input$num3 > chest_range[2],
                    paste("Chest circumference should be between", chest_range[1], "and", chest_range[2]))
    
    feedbackWarning("num4", input$num4 < hip_range[1] || input$num4 > hip_range[2],
                    paste("Hip circumference should be between", hip_range[1], "and", hip_range[2]))
    
    feedbackWarning("num5", input$num5 < biceps_range[1] || input$num5 > biceps_range[2],
                    paste("Biceps circumference should be between", biceps_range[1], "and", biceps_range[2]))
    
    feedbackWarning("num6", input$num6 < wrist_range[1] || input$num6 > wrist_range[2],
                    paste("Wrist circumference should be between", wrist_range[1], "and", wrist_range[2]))
    
    # 计算体脂率
    bodyfat <- 0.37496332 * input$num1 - 0.56563415 * input$num2 + 
      0.79858893 * input$num3 - 0.29886789 * input$num4 + 
      0.23762448 * input$num5 - 1.71562625 * input$num6 + 
      10.718498170714692
    
    rounded_bodyfat <- round(bodyfat, 1)
    
    # 显示计算结果
    output$result <- renderText({
      paste("Bodyfat:", rounded_bodyfat)
    })
    
  })
}

shinyApp(ui = ui, server = server)
