# Exploratory Data Analysis 
# Week_03 assignments
# Question_06 a.k.a plot6.R
#
# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in 
# motor vehicle emissions?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Compute total emissions for the period 1999 to 2008 from PM2.5 dataset for 
# Baltimore City, Maryland for source type of motor vehicles.
NEI$year <- factor(NEI$year)
NEI_subset <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
total_emissions_df <- aggregate(Emissions ~ year + fips, data = NEI_subset, sum)
colnames(total_emissions_df) <- c("year", "fips", "total_emissions")

# Plot using ggplot2 with different facets.
library(ggplot2)

g_plot <- ggplot(data=total_emissions_df, aes(x=year, y=total_emissions, group=fips, colour=fips)) + geom_line() + geom_point() + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total PM2.5 emissions from Baltimore City, Maryland,\n for motor vehicle sources for the years 1999 to 2008") + scale_colour_discrete(name="County", labels=c("Los Angeles \nCounty, California", "Baltimore City, Maryland"))

print(g_plot)
ggsave(filename="plot6.png", plot=g_plot)
