library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
baltimoreOnroad <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
baltimoreOnroadAggregate <- aggregate(list(Emissions = baltimoreOnroad$Emissions), list(year = baltimoreOnroad$year), sum)
png("plot5.png", width=640, height=480)
g <- ggplot(baltimoreOnroadAggregate, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
xlab("Year")+
ggtitle('Total Emissions from motor vehicles in Baltimore from 1999-2008')
print(g)
dev.off()