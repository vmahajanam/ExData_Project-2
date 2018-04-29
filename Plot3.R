library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEIBaltimore <- NEI[NEI$fips == "24510" ,]
emissionsAggregate <- aggregate(list(Emissions = NEIBaltimore$Emissions), by = list(year = NEIBaltimore$year , type = NEIBaltimore$type) , sum)
png("plot3.png", width=480, height=480) 
g <- ggplot(emissionsAggregate, aes(year, Emissions, color = type))
g <- g + geom_line()+
ggtitle('Total PM2.5 Emissions in Baltimore by type from 1999 to 2008')
print(g)
dev.off()
