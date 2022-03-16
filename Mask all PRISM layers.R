library(sf)
library(raster)
library(tidyverse)
library(tmap)
library(viridis)

rm(list=ls()) # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
dev.off()     # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
cat("\f")     # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

setwd("~/Git/PRISM")
l = list.files(pattern = ".bil.bil")
r = list()
for(i in l){
  r1 = raster(i)
  r[[i]] = r1
}
stck<-raster::stack(r)

modis<-raster("800m_modis_vegetation.tif")
stck=raster::mask(stck, modis)

writeRaster(stck, paste0("mask.tiff"), bylayer = T, suffix = "names", overwrite = T)

