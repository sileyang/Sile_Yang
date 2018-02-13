library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 14, min = 0, max = 100),
  plotOutput("hist")
)
# tell the server how to use input to get output
server <- function(input, output){
  # need to save output$hist: same name in the output
  output$hist <- renderPlot({
    title <- "Histogram of input"
    hist(rnorm(input$num), main = title)}) # render+Type of object 
  # + code buliding the object
}

shinyApp(ui = ui, server = server)