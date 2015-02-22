##Note: the source sample data should also be in the same folder as this R file.
#setwd("~/coursera/Exploratory_Data_Analysis/Course Project 2")

## ==============================================================
##PLot 1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Aggregate the emissions
aggTotals <- aggregate(Emissions ~ year,NEI, sum)
## set the plot size
png("plot1.png",width=480,height=480,units="px",bg="transparent")
## plot
barplot((aggTotals$Emissions)/10^6, names.arg=aggTotals$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)", main="Total PM2.5 Emissions From All US Sources" )
dev.off()

#=================================================================

