# Exploratory Data Analysis 
# Week_03 assignments
# Question_02 a.k.a plot2.R
#
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Compute total emissions for the period 1999 to 2008 from PM2.5 dataset for 
# Baltimore City, Maryland
NEI$year <- factor(NEI$year)
NEI_subset <- subset(NEI, fips == "24510")
total_emissions_df <- aggregate(Emissions ~ year, data = NEI_subset, sum)
colnames(total_emissions_df) <- c("year", "total_emissions")

# Open plot2.png
png("plot2.png", height=480, width=480)

# Configure multiplot
par(mfrow=c(1,1))

# Total emissions from PM2.5 during the period 1999 to 2008.
plot(total_emissions_df$year, 
     total_emissions_df$total_emissions, 
     pch=NA, 
     xlab="Year", 
     ylab="Total Emissions (tons)")
lines(total_emissions_df$year, total_emissions_df$total_emissions)
title(main = "Total PM2.5 emissions from Baltimore City, Maryland,\n for the years 1999 to 2008")
# Close PNG file
dev.off()
