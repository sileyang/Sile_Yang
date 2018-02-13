
library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 14, min = 0, max = 100),
  textInput(inputId = "title",
            label = "write a title",
            value = "histogram of the data"),
  sliderInput(inputId = "num1",
              label = "Choose another number",
              value = 20, min = 0, max = 100),
  plotOutput("hist1"),
  plotOutput("hist2"),
  verbatimTextOutput("stats")
  
)
# tell the server how to use input to get output
server <- function(input, output){
  # need to save output$hist: same name in the output
  output$hist1 <- renderPlot({
    title <- input$title
    hist(rnorm(input$num), main = title)}) # render+Type of object 
  # + code buliding the object
  output$hist2 <- renderPlot({
    title <- "Histogram of input2"
    hist(rnorm(input$num1), main = title)})
  output$stats <- renderPrint({
    summary(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)

# use shinyapps.io to share the website
# install.package("devtools")
# devtools::install_github("rstudio/shinyapps")