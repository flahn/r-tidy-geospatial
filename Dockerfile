FROM rocker/r-ver:3.5.1
MAINTAINER Florian Lahn (florian.lahn@uni-muenster.de)
LABEL version="0.1" \
	description="R image with tidyverse and geospatial elements" 


# commands from rocker/tidyverse
RUN apt-get update -qq && apt-get -y --no-install-recommends install \ 
	libcurl4-openssl-dev \
	libssl-dev \
	libjpeg-dev \
	libxml2-dev \ 
	libcairo2-dev \ 
	libsqlite-dev \ 
	libsqlite3-dev \ 
	libmariadbd-dev \ 
	libmariadb-client-lgpl-dev \ 
	libpq-dev \ 
	libssh2-1-dev \ 
&& install2.r --error \ 
	--deps TRUE \ 
	curl \
	openssl \
	httr \
	rvest \ 
	tidyverse \ 
	dplyr \ 
	devtools \ 
	formatR \ 
	remotes \ 
	future \
	selectr \
	BiocManager
	
# from rocker/geospatial
RUN apt-get install -y --no-install-recommends \ 
	lbzip2 \ 
	libfftw3-dev \ 
	libgdal-dev \ 
	gdal-bin \
	libgeos-dev \ 
	libgsl0-dev \ 
	libgl1-mesa-dev \ 
	libglu1-mesa-dev \ 
	libhdf4-alt-dev \ 
	libhdf5-dev \ 
	liblwgeom-dev \ 
	libproj-dev \ 
	libnetcdf-dev \ 
	libudunits2-dev \
	tk-dev \ 
	unixodbc-dev \ 
&& install2.r --error \ 
	RColorBrewer \ 
	RandomFields \ 
	classInt \ 
	deldir \ 
	gstat \ 
	proj4 \ 
	raster \ 
	rgdal \ 
	rgeos \ 
	rlas \ 
	sf \ 
	sp \ 
	spacetime \ 
	spatstat \ 
	spdep \ 
	geoR \ 
	stars \
	gdalUtils \
	DBI \
	RSQLite \
	&& R -e "BiocManager::install('rhdf5')"
