## reading the data and classification code guides
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## loading the necessary packages
library(ggplot2)

## merging the NEI and SCC files by SCC
NEISCC <- merge(NEI,SCC, by="SCC")

## subsetting by Baltimore City and motor vehicle sources
bmore <- subset(NEISCC, NEISCC$fips == "24510" & NEISCC$type == "ON-ROAD")

## summing the emissions by grouping of Baltimore and ON-ROAD
bmoresum <- aggregate(Emissions ~ year, bmore, sum)

## line graph using ggplot from the ggplot2 plotting system
ggplot(bmoresum, aes(year, Emissions))+ geom_line() + xlab("Year") + ylab("Tons") +
ggtitle("Total On-Road Emissions in Baltimore in 1999, 2002, 2005, 2008")
