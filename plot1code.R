setwd("C:/Users/norma_000/Desktop/nc/R/CourseraFiles")

## reading the data and classification code guides
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## loading the necessary packages
> library(dplyr)
> library(ggplot2)

## head(), dim(), str(), summary() of the data, only for Part I

head(NEI)
    fips      SCC Pollutant Emissions  type year
4  09001 10100401  PM25-PRI    15.714 POINT 1999
8  09001 10100404  PM25-PRI   234.178 POINT 1999
12 09001 10100501  PM25-PRI     0.128 POINT 1999
16 09001 10200401  PM25-PRI     2.036 POINT 1999
20 09001 10200504  PM25-PRI     0.388 POINT 1999
24 09001 10200602  PM25-PRI     1.490 POINT 1999

dim(NEI)
[1] 6497651       6

## str of NEI.  Important that Emission is numerics so no need to convert

str(NEI)
'data.frame':	6497651 obs. of  6 variables:
 $ fips     : chr  "09001" "09001" "09001" "09001" ...
 $ SCC      : chr  "10100401" "10100404" "10100501" "10200401" ...
 $ Pollutant: chr  "PM25-PRI" "PM25-PRI" "PM25-PRI" "PM25-PRI" ...
 $ Emissions: num  15.714 234.178 0.128 2.036 0.388 ...
 $ type     : chr  "POINT" "POINT" "POINT" "POINT" ...
 $ year     : int  1999 1999 1999 1999 1999 1999 1999 1999 1999 1999 ...


summary(NEI)
     fips               SCC             Pollutant           Emissions            type          
 Length:6497651     Length:6497651     Length:6497651     Min.   :     0.0   Length:6497651    
 Class :character   Class :character   Class :character   1st Qu.:     0.0   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Median :     0.0   Mode  :character  
                                                          Mean   :     3.4                     
                                                          3rd Qu.:     0.1                     
                                                          Max.   :646952.0                     
      year     
 Min.   :1999  
 1st Qu.:2002  
 Median :2005  
 Mean   :2004  
 3rd Qu.:2008  
 Max.   :2008  


## summing the emissions by year
sumpm25 <- with(NEI, aggregate(NEI$Emissions, by = list(year), sum))

## graph using plot from the base plotting system
plot(sumpm25, type="o", lwd=3, main="Total PM25 Emissions from 1999, 2002, 2005, and 2008",
     xlab = "Year", ylab = "Tons", pch=10)


