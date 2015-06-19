library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Developing Data Products App"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("iter",
                  "Number of iterations:",
                  min = 2,
                  max = 1000,
                  value = 500),
      "The app calculates the means of 40 random exponentials for however many iterations the user wants.
       Simply use the sliderbar to adjust the number of iterations, and the app will update the distribution
       as well as the theoretical normal distribution for comparison"
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("hist2")
    )
  )
)) 
