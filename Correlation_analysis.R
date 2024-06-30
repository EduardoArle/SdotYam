#load packages
library(raster); library(sf)

#list WDs
wd_vars <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole/Variables'
wd_points <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole'

#load variables
setwd(wd_vars)

hab_map <- raster()   #### missing
depth <- raster()     #### missing
dist_border <- raster('distance_boarder.tif')
slope <- raster('slope.tif')
slope_of_slope <- raster('slope_of_slope.tif')
BPI_25_250 <- raster('broadbpi_25_250.tif')
dist_shore <- raster('distance_shore.tif')

#make all variables have the same extention
dist_border2 <- projectRaster(dist_border, slope)
dist_border3 <- mask(dist_border2, slope)

dist_shore2 <- projectRaster(dist_shore, slope)
dist_shore3 <- mask(dist_shore2, slope)


plot(dist_shore)
plot(dist_shore2)
plot(dist_shore3)


t <- stack(slope, slope_of_slope, BPI_25_250, dist_border3, dist_shore3)

  
plot(t)

#load points
