# Exploratory Data Analysis 
# Week_03 assignments
# Question_01 a.k.a plot1.R
#
# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Compute total emissions for the period 1999 to 2008 from PM2.5 dataset. 
NEI$year <- factor(NEI$year)
total_emissions_df <- aggregate(Emissions ~ year, data = NEI, sum)
colnames(total_emissions_df) <- c("year", "total_emissions")

# Open plot1.png
png("plot1.png", height=480, width=480)
 
# Configure multiplot
par(mfrow=c(1,1))
 
# Total emissions from PM2.5 during the period 1999 to 2008.
plot(total_emissions_df$year, 
     total_emissions_df$total_emissions, 
      pch=NA, 
      xlab="Year", 
      ylab="Total Emissions (tons)")
lines(total_emissions_df$year, total_emissions_df$total_emissions)
title(main = "Total PM2.5 emissions from all sources\n for the years 1999 to 2008")
# Close PNG file
dev.off()
