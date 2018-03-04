## reading the data and classification code guides
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## loading the necessary package
library(ggplot2)

## dataset of Balitmore, named after its football team
ravens <- subset(NEI, NEI$fips == "24510")

## summming the emissions by type
ravens_type <- aggregate(Emissions ~ year + type, ravens, sum)

## graph using ggplot from the ggplot2 plotting system
ggplot(ravens_type, aes(year, Emissions, color = type)) +
  geom_line() +
  xlab("Year") +
  ylab("Tons") +
  ggtitle("Total Emissions by Type in Baltimore in 1999, 2002, 2005, 2008")
