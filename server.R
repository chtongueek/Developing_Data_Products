library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    
    iter = input$iter
    lam = .2
    n = 40
    
    means = matrix(0, 1, iter)
    
    for (i in 1:iter){
      
      means[i] = mean(rexp(n, lam))
      
    }
    
    
    mu = mean(means)
    sd = sd(means)
    var = sd(means)^2
    
    xlim = c(mu - 3*sd, mu + 3*sd)
    ylim = c(0, 1)
    x = seq(from = xlim[1], to = xlim[2], by = .01)
    
    norm = 1/(sqrt(2*pi*var))*exp(-(x-mu)^2/(2*var))
    
    # draw the histogram with the specified number of bins
    title = paste("Histogram of ", input$iter, "means")
    hist(means, 20, xlim = xlim, ylim = ylim, freq = F, col = "red", main = title)
    par(new = T)
    plot(x, norm, type = 'l', xlim = xlim, ylim = ylim, ann = F)
    abline(v = mu, col = "blue")
    abline(v = 5, col = "green")
    legend("topright", c("mean", "Theoretical Mean"), pch = 'l', col = c('blue', 'green'))
    
  })
  hist2 = renderPlot({hist(runif(input$iter))})
})
