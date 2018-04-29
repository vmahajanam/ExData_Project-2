library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
coalEmissionMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
coalEmissions <- NEISCC[coalEmissionMatches, ]
coalemissionsAggregate <- aggregate(list(Emissions = coalEmissions$Emissions), list(year = coalEmissions$year), sum)
png("plot4.png", width=640, height=480)
g <- ggplot(coalemissionsAggregate, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
xlab("Year")+
ggtitle('Total Emissions from coal sources from 1999-2008')
print(g)
dev.off()




