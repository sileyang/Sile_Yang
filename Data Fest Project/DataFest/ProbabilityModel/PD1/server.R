function(input, output) {
  output$ex1 <- renderUI({
    withMathJax(sprintf("$$\\text{Regression:}\\space log(N) = a + b*M$$"))
  })
  
  output$ex2 <- renderUI({
    withMathJax(sprintf("$$log(n1) = a+b*M +s$$"))
  })
  output$ex3 <- renderUI({
    withMathJax(sprintf("$$N_1 = 10^{log(n1)}$$"))
  })
  
  output$ex4 <- renderUI({
    withMathJax(sprintf("$$P(t, Mag) = 1-exp(-N_1 t)$$"))
  })
  
    output$Plot = renderPlot({
    data1 <- data[data$Country == input$Country,]
    plot(data1[1:80, ]$t, data1[1:80, ]$pd, 
         col = "red", lty = 1, pch = 1, 
         main = "Probability by Future years",
         xlab = "Times", ylab = "Probability", cex = 0.5, xlim = c(1, 100),
         ylim = c(0, 1.2))
    points(data1[81:160, ]$t, data1[81:160, ]$pd,
             col = "green", pch = 2, cex = 0.5)
    points(data1[161:240, ]$t, data1[161:240, ]$pd,
           col = "blue", pch = 3, cex = 0.5)
    legend("topright", legend = c("M>=6.5", "M>=7.0", "M>=7.5"),
    bty = 'n', pch = c(1, 2, 3), cex = 1.0)
  })
    output$value <- renderPrint({
      data <- data_all
        c1 <- c("#Prediction Probability", 
              data[data$Mag == input$Magnitude & data$t == input$Time 
                   & data$Country == input$Country1,])
      print(c1)})
}