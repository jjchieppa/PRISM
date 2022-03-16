library(sf)
library(raster)
library(tidyverse)
library(tmap)
library(viridis)

rm(list=ls()) # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
dev.off()     # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
cat("\f")     # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

setwd("~/Git/NutNet_Pmodel_sims/CRU_clim")
modis<-raster("modis_vegetation.tif")

setwd("~/Git/PRISM")
l = list.files(pattern = ".bil.bil")
r = list()
for(i in l){
  r1 = raster(i)
  r[[i]] = r1
}

proj=r[[1]]
proj<-raster(proj)
crs(proj)=4326
beginCluster(type = "SOCK", n = 4)
new<-projectRaster(modis, proj, method = "ngb")
endCluster()

writeRaster(new, "800m_modis_vegetation.tif", overwriter = T)


