## reading the data and classification code guides
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## loading the necessary package
library(ggplot2)

## merging the NEI and SCC files by SCC, sorry for the long execution time
NEISCC <- merge(NEI,SCC, by="SCC")

## selecting the coal records based on the string "coal" in the Short.Name category
coal <- NEISCC[grepl("Coal",NEISCC$Short.Name,ignore.case=TRUE),]

## summming the emissions by coal records
coalsum <- aggregate(Emissions ~ year, coal, sum)

## line graph using ggplot from the ggplot2 plotting system
ggplot(coalsum, aes(year, Emissions))+
  geom_line() + 
  xlab("Year") + 
  ylab("Tons") +
  ggtitle("Total Emissions by Coal Sources in 1999, 2002, 2005, 2008")
