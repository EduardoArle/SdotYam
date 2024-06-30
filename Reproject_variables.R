#load packages
library(raster); library(sf)

#list WDs
wd_vars <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole/Variables'

#load variables
setwd(wd_vars)

hab_map <- raster('habitat_map_4classes.tif')  
depth <- raster('IPC_Hadera_MB_SB_RTK_2021_1m_UTM.tif') #check
dist_border <- raster('distance_boarder.tif')
slope <- raster('slope.tif')
slope_of_slope <- raster('slope_of_slope.tif')
BPI_25_250 <- raster('broadbpi_25_250.tif')
dist_shore <- raster('distance_shore.tif')
classified <- raster('classified_BTM.tif')

#make all variables have the same extention
dist_border2 <- projectRaster(dist_border, slope)
dist_border3 <- mask(dist_border2, slope)

dist_shore2 <- projectRaster(dist_shore, slope)
dist_shore3 <- mask(dist_shore2, slope)

hab_map2 <- projectRaster(hab_map, slope)
hab_map3 <- mask(hab_map2, slope)

#save modified vars
writeRaster(dist_border3, 'distance_boarder_reproj.tif')
writeRaster(dist_shore3, 'distance_shore_reproj.tif')
writeRaster(hab_map3, 'habitat_map_4classes_reproj.tif')


