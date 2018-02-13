# Use a fluid Bootstrap layout
fluidPage( 
  
  titlePanel("Worldwide Disaster"),
  mainPanel(
    plotOutput("Plot1")),
  
  fluidRow(
    column(9,
           sliderInput(inputId = "Year",
                       label = "Choose a Year",
                       value = 2017, min = 1967, max = 2017)
    )
  ),
  
  hr(),
  fluidRow(
    column(9, verbatimTextOutput("value"))
  ),
  fluidRow(
    column(9,
           sidebarLayout(      
             
             # Define the sidebar with one input
             sidebarPanel(
               selectInput("State", "State in the U.S:", 
                           choices=rownames(data))),
             hr()
           ))),
  
  # Give the page a title
  titlePanel("Earthquke frequency by year"),
  
  mainPanel(
    plotOutput("Plot")
  )
  # Generate a row with a sidebar
  
  
  
  # Create a spot for the barplot
  
)