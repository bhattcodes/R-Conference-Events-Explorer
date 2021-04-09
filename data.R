
# Prep workspace ----------------------------------------------------------

mydata <- readRDS(".\\R_Events.rds")
sch<<-NULL
for(element in mydata){
  sch<-rbind(sch,element)
}
  


library(dplyr)  # tidy data manipulation
library(leaflet)  # interative mapping



#main work --------------------------------


map <- sch %>% 
  leaflet::leaflet() %>%
  leaflet::addProviderTiles(providers$OpenStreetMap) %>% 
  leaflet::addAwesomeMarkers(
    lng = sch$venue_lon,
    lat = sch$venue_lat,
    popup = ~paste0(
      "<h1>", sch$name, "</h1>",
      
      "<table style='width:100%'>",
      
      "<tr>",
      "<th>Venue Name</th>",
      "<th>", sch$venue_name, "</th>",
      "</tr>",
      
      "<tr>",
      "<tr>",
      "<th>Date</th>",
      "<th>", sch$local_date, "</th>",
      "</tr>",
      
      "<tr>",
      "<tr>",
      "<th>Time</th>",
      "<th>", sch$time, "</th>",
      "</tr>",
      
      "<tr>",
      "<tr>",
      "<th>Location</th>",
      "<th>", sch$venue_address_1, ", ", sch$venue_zip, "</th>",
      "</tr>",
      
      "<tr>",
      "<tr>",
      "<th>Country</th>",
      "<th>", sch$venue_country, "</th>",
      "</tr>"
    ) # end popup()
   #   iconColor = "white",
    #  markerColor = ifelse(
     #   test = sch$status == "upcoming", 
      #  yes = "green",
       # no = "blue"
)%>%   
  leaflet::addMeasure()

print(map)