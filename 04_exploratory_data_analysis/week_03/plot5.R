# Exploratory Data Analysis 
# Week_03 assignments
# Question_05 a.k.a plot5.R
#
# How have emissions from motor vehicle sources changed 
# from 1999-2008 in Baltimore City?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Compute total emissions for the period 1999 to 2008 from PM2.5 dataset for 
# Baltimore City, Maryland for source type of motor vehicles.
NEI$year <- factor(NEI$year)
NEI_subset <- subset(NEI, fips == "24510" & type == "ON-ROAD")
total_emissions_df <- aggregate(Emissions ~ year, data = NEI_subset, sum)
colnames(total_emissions_df) <- c("year", "total_emissions")

# Plot using ggplot2 with different facets.
library(ggplot2)

g_plot <- ggplot(data=total_emissions_df, aes(x=year, y=total_emissions, group=1)) + geom_line() + geom_point() + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total PM2.5 emissions from Baltimore City, Maryland,\n for motor vehicle sources for the years 1999 to 2008")

print(g_plot)
ggsave(filename="plot5.png", plot=g_plot)

# Alternative plotting using ggplot.
# # How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
# png('plot5.png')
# ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
#   ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
#   ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
#   geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
# dev.off()