library(leaflet)

function(input, output, session) {
  
  
  filteredData <-reactive({
    earthquakes[earthquakes$mag >= input$range[1] & earthquakes$mag <= input$range[2],]
  })
  
  colorpal <- reactive({
    colorNumeric(input$colors, earthquakes$mag)
  })
  
  output$map <- renderLeaflet({
    leaflet(earthquakes) %>% addTiles() %>% addProviderTiles(providers$OpenStreetMap.Mapnik) %>% addMiniMap()%>%
      fitBounds(~min(longitude), ~min(latitude), ~max(longitude), ~max(latitude))
  })
  
  observe({
    pal <- colorpal()
    
    leafletProxy("map", data = filteredData()) %>%
      clearShapes() %>%
      addCircles(radius = ~5^mag/5, weight = 1, color = "#777777",
                 fillColor = ~pal(mag), fillOpacity = 0.7, popup = ~paste(mag)
      )
  })
  
  observe({
    proxy <- leafletProxy("map", data = quakes)
    
    
    proxy %>% clearControls()
    if (input$legend) {
      pal <- colorpal()
      proxy %>% addLegend(position = "bottomright",
                          pal = pal, values = ~mag
      )
    }
  })
}