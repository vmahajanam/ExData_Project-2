library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
baltimoreLAOnroad <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
baltimoreLAOnroadAggregate <- aggregate(list(Emissions = baltimoreLAOnroad$Emissions), list(year = baltimoreLAOnroad$year, fips=baltimoreLAOnroad$fips), sum)
png("plot6.png", width=1040, height=480)
g <- ggplot(baltimoreLAOnroadAggregate, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity") +
xlab("Year")+
ggtitle('Total Emissions from motor vehicles in LA vs Baltimore from 1999-2008')+
theme(plot.title = element_text(hjust=0.5))
print(g)
dev.off()