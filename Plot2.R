NEI <- readRDS("summarySCC_PM25.rds")
NEIBaltimore <- NEI[NEI$fips == "24510" ,]
emissionsAggregate <- aggregate(list(Emissions = NEIBaltimore$Emissions), list(year = NEIBaltimore$year), sum)
png("plot2.png", width=480, height=480) 
barplot(height=emissionsAggregate$Emissions, names.arg=emissionsAggregate$year, xlab="Year", ylab="Emission",main="Total PM2.5 emissions in Baltimore for the years 1999-2008")
dev.off()