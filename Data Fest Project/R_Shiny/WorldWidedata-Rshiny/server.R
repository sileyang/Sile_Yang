# Define a server for the Shiny app
function(input, output) {
  
  output$Plot1 = renderPlot({
    par(mfrow=c(1,2))
    plot(data2$earthquake~data2$year, col = "red", lty = 1, pch = "*", 
         main = "Earthquake Frequence by Year",
         xlab = "Year", ylab = "Earthquake Frequence", cex = 0.5)
    lines(data2$year, data2$earthquake, col = "red", pch = 1)
    
    plot(data2$tsunami~data2$year, col = "red", lty = 1,pch = "*",
         main = "Tsunami & Volcano Frequence by Year",
         xlab = "Year", ylab = "Frequence")
    lines(data2$year, data2$tsunami, col = "red", lty = 1, pch = "*")
    points(data2$volcano~data2$year, col = "blue", lty = 2, pch = "*")
    lines(data2$year, data2$volcano, col = "blue", lty = 2, pch = "*")
    legend("topleft", legend = c("Tsunami", "Volcano"),
           bty = 'n', lty = c(1, 2), cex = 1.0)
  })
 
  # Fill in the spot we created for a plot
  output$Plot <- renderPlot({
    
    # Render a barplot
    barplot(as.matrix(data[rownames(data) == input$State, ]), 
            main=input$State,
            ylab="num",
            xlab="Year")
 })
  
  
  output$value <- renderPrint({
    c1 <- c("#earthquake", data2[data2$year == input$Year,]$earthquake)
    c2 <- c("#tsunami", data2[data2$year == input$Year,]$tsunami)
    c3 <- c("#volcano", data2[data2$year == input$Year,]$volcano)
    print(c(c1, c2, c3))})
}




