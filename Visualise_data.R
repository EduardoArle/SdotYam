#list packages
library(sf); library(terra)

#list WDs
wd_occ <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole/Data'
wd_vars <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole/Variables'

#load table
setwd(wd_occ)
data <- read.csv('Data_wrangling_20240728.csv')

#load one variable
setwd(wd_vars)
hab_map <- rast('habitat_map_4classes_reproj.tif')  

#look at data
head(data)

#load geojson file
meta <- read_sf('meta_20240728_clean.geojson')

#look at metadata
as.data.frame(meta)

#visualise on the map
plot(hab_map)
plot(st_geometry(meta), pch = 19, cex = 0.5, col = '#FF0000', add = T)


### QUESTIONS ###


# What do the columns Min.. , Max.. , and Mean.. mm. mean in the data?

# Do I relate the occurrences to the locations shapefile by the BRUV_ID?

