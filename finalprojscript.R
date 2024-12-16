##Script for my final project on wildfire damage in the United States:
##note: reflect the cumulative materials covered in class.

#website used: https://data-nifc.opendata.arcgis.com/datasets/85d3f50b5eee4dcfa48f5e4fb23aa9e1_0/explore?location=36.483771%2C-113.977515%2C5.00

#install and load packages
install.packages(c("dplyr", "lubridate"))
library(dplyr)
library(lubridate)

#read in data
fire <- read.csv("/Cloud/project/annual-carbon-dioxide-emissions.csv")

#df for Europe
Europe <- emissions[emissions$Entity == "Europe",]

#df for Asia
Asia <- emissions[emissions$Entity == "Asia",]

#df for Australia
Australia <- emissions[emissions$Entity == "Australia",]

#df for South America
S.America <- emissions[emissions$Entity == "South America",]

#df for North America
N.America <- emissions[emissions$Entity == "North America",]

#df for Africa
Africa <- emissions[emissions$Entity == "Africa",]
mean(Africa$Annual.carbon.dioxide.emissions)

#df for continents
cont <- emissions[emissions$Entity == "Africa"| emissions$Entity == "North America"| emissions$Entity =="South America"|
                  emissions$Entity == "Australia"| emissions$Entity == "Asia"| emissions$Entity == "Europe",]

#plot of emissions via wildfire on each continent
plot(cont$Entity, cont$Annual.carbon.dioxide.emissions,
     barplot(),
     ylab = "CO2 Emissions",
     xlab = "Continent")

#plot of aus emissions via wildfire per year, then add the continents
plot(N.America$Year, N.America$Annual.carbon.dioxide.emissions,
     type = "b",
     pch = 15,
     ylab = "CO2 Emissions",
     xlab = "Year",
     ylim = c(0,1547662200))
points(Australia$Year, Australia$Annual.carbon.dioxide.emissions,
       type = "b",
       pch = 15,
       col = "red")
points(S.America$Year, S.America$Annual.carbon.dioxide.emissions,
       type = "b",
       pch = 15,
       col = "blue")
points(Africa$Year, Africa$Annual.carbon.dioxide.emissions,
       type = "b",
       pch = 15,
       col = "magenta")
points(Europe$Year, Europe$Annual.carbon.dioxide.emissions,
       type = "b",
       pch = 15,
       col = "purple")
points(Asia$Year, Asia$Annual.carbon.dioxide.emissions,
       type = "b",
       pch = 15,
       col = "orange")
par(mar = c(3, 3, 3, 8), xpd = TRUE) 
legend("topright", inset=c(-0.2,0),
       legend = c("North America", "Europe", "Asia"),
       col=c("black", "purple", "orange"),
       pch=(19), bty= "n", cex = 0.6)
