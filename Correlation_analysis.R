#load packages
library(terra); library(sf)

#list WDs
wd_vars <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole/Variables'
wd_points <- '/Users/carloseduardoaribeiro/Documents/Collaborations/Ole'

#load variables
setwd(wd_vars)

hab_map <- rast('habitat_map_4classes_reproj.tif')  
depth <- rast('IPC_Hadera_MB_SB_RTK_2021_1m_UTM.tif') 
dist_border <- rast('distance_boarder_reproj.tif')
slope <- rast('slope.tif')
slope_of_slope <- rast('slope_of_slope.tif')
BPI_25_250 <- rast('broadbpi_25_250.tif')
dist_shore <- rast('distance_shore_reproj.tif')
classified <- rast('classified_BTM.tif')

#stack vars
all_vars <- c(hab_map, depth, dist_border, slope, slope_of_slope, BPI_25_250,
                  dist_shore, classified)

cont_vars <- c(depth, dist_border, slope, slope_of_slope, BPI_25_250,
               dist_shore)

#load points
setwd(wd_points)
points <- read_sf('sample_points.geojson')

#get values 
values <- extract(cont_vars, points)

#check point without info
points[174,]

#check for NAs
NAs <- which(is.na(values))

#get rid of NAs
values2 <- values[complete.cases(values),]

#calculate correlation
correl <- cor(values2[,-1])

#save correlation matrix
setwd(wd_points)
write.csv(correl, 'Correlation_matrix.csv')
