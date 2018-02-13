# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- data
    if (input$Disaster != "All") {
      data <- data[data$D_type == input$Disaster,]
    }
    if (input$Country != "All") {
      data <- data[data$Country == input$Country,]
    }
    if (input$Year != "All") {
      data <- data[data$Year == input$Year,]
    }
    data
  }))
  
}