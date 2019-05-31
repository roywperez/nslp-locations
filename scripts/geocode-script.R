library(leaflet)
library(ggmap)
library(tidyverse)
library(openxlsx)
library(here)

addresses <- read.xlsx("data/2017-2018_NSLP-CE-addressesv3.xlsx", sheet = 1, colNames = TRUE)

geocoded <- data.frame(stringsAsFactors = FALSE)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon

for(i in 1:nrow(addresses))
{
  # Print("Working...")
  result <- geocode(addresses$Street.Address[i], output = "latlona", source = "google")
  addresses$lon[i] <- as.numeric(result[1])
  addresses$lat[i] <- as.numeric(result[2])
  addresses$geoAddress[i] <- as.character(result[3])
}

write.xlsx(addresses,"geocoded-addresses3.xlsx")
