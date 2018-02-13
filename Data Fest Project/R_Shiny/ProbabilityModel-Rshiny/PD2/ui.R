fluidPage(
  titlePanel("Probabilty Prediction given Radius"),
  
  title = 'Formular',
  withMathJax(),
  uiOutput('ex1'),
  uiOutput('ex2'),
  uiOutput('ex3'),
  uiOutput('ex4'),
  sidebarPanel(
    sidebarLayout(position = "left",
           selectInput("Country", label = "Select a Country", 
                       choices = unique(as.character(data$Country))), 
           hr()
    )),
  
  mainPanel(
    plotOutput("Plot")
  ),
  
  fluidRow(
    column(8,
           sidebarPanel(
             sidebarLayout(
               selectInput("Country1", label = "Select a Country", 
                           choices = unique(as.character(data$Country))), 
               hr()
             )))),
  fluidRow(
    column(8,
           sidebarPanel(
             sidebarLayout(
               selectInput("Magnitude", label = "Select a Magnitude level", 
                           choices = unique(as.character(data$Mag))), 
               hr()
             )))),
  
  fluidRow(
    column(9,
           sliderInput(inputId = "Time",
                       label = "Select a Future Time",
                       value = 20, min = 1, max = 80)
    )
  ),
  
  fluidRow(
    column(9, verbatimTextOutput("value"))
  )
)