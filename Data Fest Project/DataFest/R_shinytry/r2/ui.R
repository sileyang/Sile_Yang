library(shiny)
ui <- fluidPage(
  selectInput(inputId = "Country",label = "Choose a destination",
              list("US", "UK", "Japan")),
  textOutput("result")
)
# tell the server how to use input to get output

server <- function(input, output){
  # need to save output$hist: same name in the output
  output$result <- renderText({
    paste(input$state)
  })
}
shinyApp(ui = ui, server = server)