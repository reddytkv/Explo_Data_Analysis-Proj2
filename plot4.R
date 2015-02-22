#setwd("~/coursera/Exploratory_Data_Analysis/Course Project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#=================================================================

# Subset coal combustion related NEI data
combRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combRelated & coalRelated)
combSCC <- SCC[coalCombustion,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)
ggp <- ggplot(combNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" US Wide Coal Combustion Source from 1999-2008"))
print(ggp)

dev.off()
#=================================================================