# Exploratory Data Analysis 
# Week_03 assignments
# Question_03 a.k.a plot3.R
#
# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four 
# sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Compute total emissions for the period 1999 to 2008 from PM2.5 dataset for 
# Baltimore City, Maryland
NEI$year <- factor(NEI$year)
NEI$type <- factor(NEI$type)
NEI_subset <- subset(NEI, fips == "24510")
total_emissions_df <- aggregate(Emissions ~ year + type, data = NEI_subset, sum)
colnames(total_emissions_df) <- c("year", "type", "total_emissions")

# Plot using ggplot2 with different facets.
library(ggplot2)

g_plot <- ggplot(data=total_emissions_df, aes(x=year, y=total_emissions, group=type, colour=type)) + geom_line() + geom_point() + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total PM2.5 emissions from Baltimore City, Maryland,\n by source type for the years 1999 to 2008")

print(g_plot)
ggsave(filename="plot3.png", plot=g_plot)


# Alternative solution based on using boxplots.
# # Load RDS
# require(ggplot2)
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# 
# # Sample data for testing
# NEIsample <- NEI[sample(nrow(NEI), size=5000, replace=F), ]
# 
# # Baltimore City, Maryland == fips
# MD <- subset(NEI, fips == 24510)
# MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))
# 
# # Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# # which of these four sources have seen decreases in emissions from 1999??2008 for Baltimore City? 
# # Which have seen increases in emissions from 1999??2008? 
# # Use the ggplot2 plotting system to make a plot answer this question.
# png('plot3.png', width=800, height=500, units='px')
# ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
#   geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
#   ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
#   ggtitle('Emissions per Type in Baltimore City, Maryland') +
#   geom_jitter(alpha=0.10)
# dev.off()
