## reading the data and classification code guides
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## dataset of Balitmore, named after its football team
ravens <- subset(NEI, NEI$fips == "24510")

## summing the emissions by year
ravens_sumpm25 <-with(ravens, aggregate(ravens$Emissions, by = list(year), sum))

## graph using plot from the base plotting system
plot(ravens_sumpm25, type="o", lwd=3, 
     main="Total Baltimore City PM25 Emissions from 1999, 2002, 2005, 2008",
     xlab = "Year", ylab = "Tons", pch=10)
