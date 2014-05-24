# Exploratory Data Analysis 
# Week_03 assignments
# Question_04 a.k.a plot4.R
#
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Find all coal combustion related sources
SCC_coal_comb <- SCC[grepl("comb", SCC$EI.Sector, ignore.case=TRUE) & 
                       grepl("coal", SCC$EI.Sector, ignore.case=TRUE),]

# Match for those in the NEI data.
NEI_subset <- subset(NEI,SCC %in% SCC_coal_comb$SCC)

# Compute total emissions for the period 1999 to 2008 from PM2.5 dataset 
NEI$year <- factor(NEI$year)
total_emissions_df <- aggregate(Emissions ~ year, data = NEI_subset, sum)
colnames(total_emissions_df) <- c("year", "total_emissions")

# Plot using ggplot2 with different facets.
library(ggplot2)

g_plot <- ggplot(data=total_emissions_df, aes(x=year, y=total_emissions)) + geom_line() + geom_point() + xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total PM2.5 emissions for the U.S.A. \nfrom coal combustion related sources,\n for the years 1999 to 2008")

print(g_plot)
ggsave(filename="plot4.png", plot=g_plot)
