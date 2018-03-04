## reading the data and classification code guides
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## loading the necessary packages
library(dplyr)
library(ggplot2)

## merging the NEI and SCC files by SCC
NEISCC <- merge(NEI,SCC, by="SCC")

## subsetting by Baltimore City and motor vehicle sources
bmore <- subset(NEISCC, NEISCC$fips == "24510" & NEISCC$type == "ON-ROAD")

## subsetting by Los Angeles County and motor vehicle sources
lacounty <- subset(NEISCC, NEISCC$fips == "06037" & NEISCC$type == "ON-ROAD")

## combining the Baltimore City and Los Angeles County datasets
compare <-rbind(bmore, lacounty)

## summing the emissions by Baltimore/ON-ROAD and LA County/ON-ROAD
comparesum <- aggregate(Emissions ~ year + fips, compare, sum)

## line graph using ggplot from the ggplot2 plotting system
ggplot(comparesum, aes(year, Emissions, color=fips)) + 
  geom_line() + xlab("Year") + ylab("Tons") + 
  ggtitle("Total Motor Vehicle Emissions Comparing Baltimore City (fips=24510) vs. LA County (fips=06037) from 1999-2008") +
  theme(plot.title = element_text(size = 7))
