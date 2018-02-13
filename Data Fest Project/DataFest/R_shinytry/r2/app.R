library(shiny)
ui <- fluidPage(
  selectInput(inputId = "Country",label = "Choose a destination",
              list(US = "https://datafest.shinyapps.io/hahaha/", 
                   UK = "http://www.google.com")),
  textOutput("result")
)
# tell the server how to use input to get output

server <- function(input, output, session){
  output$result <- renderUI({
    tags$a(href = input$Country, input$Country)
  })
}

ui <- fluidPage(
  selectInput('website', 'Choose a website'
              , list(bbc = "https://datafest.shinyapps.io/hahaha/"
                     , google = "http://www.google.com"
                     , cnn = "http://www.cnn.com")), 
  htmlOutput("mySite")
)
server <- function(input, output, session){
  output$mySite <- renderUI({
    tags$a(href = input$website, input$website)
  })
}

shinyApp(ui = ui, server = server)



shinyApp(ui = ui, server = server)