library(shiny)

ui <- fluidPage(
  selectInput('Country', 'Choose a Country'
              , list(US = "https://datafest.shinyapps.io/hahaha/"
                     , UK = "http://www.google.com"
                     , Japan = "http://www.cnn.com")), 
  htmlOutput("myCountry")
)
server <- function(input, output, session){
  output$myCountry <- renderUI({
    tags$a(href = input$Country, input$Country)
  })
}

shinyApp(ui = ui, server = server)