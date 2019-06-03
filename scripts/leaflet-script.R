library(leaflet)
library(tidyverse)
library(openxlsx)
library(here)

cepoints <- read.xlsx("data/2017-2018_NSLP-CE-geocoded-addresses.xlsx", sheet = 1, colNames = TRUE)

# Plot map of the world
map <- leaflet() %>%
  addTiles()
map

map %>% addProviderTiles(providers$Esri.WorldStreetMap)


map <- map %>% 
  addProviderTiles(providers$Esri.WorldStreetMap) %>% 
  addMarkers(data = cepoints, lng = ~lon, lat = ~lat, popup = ~CE.Name, clusterOptions = markerClusterOptions())

map

browseURL(map)
