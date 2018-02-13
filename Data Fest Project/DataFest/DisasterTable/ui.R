# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

fluidPage(
  titlePanel("Disaster DataTable"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("Disaster",
                       "Choose a Disaster:",
                       c("All",
                         unique(as.character(combined$D_type))))
    ),
    column(4,
           selectInput("Country",
                       "Choose a Country:",
                       c("All",
                         unique(as.character(combined$Country))))
    ),
    column(4,
           selectInput("Year",
                       "Choose a Year:",
                       c("All",
                         unique(as.character(data$Year))))
    )
  ),
  # Create a new row for the table.
  fluidRow(
    DT::dataTableOutput("table")
  )
)