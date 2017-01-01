# Exploratory Data Analysis Course Project 2
# Plot 3

# Load data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)

# Subset & aggregate
emissions_baltimore <- subset(NEI,fips=='24510')
emissions_by_year <- aggregate(Emissions ~ year + type, emissions_baltimore, FUN=sum)

# Generate the graph
png(filename='plot3.png')

# Set up the initial ggplot
emissions_plot <- ggplot(emissions_by_year, aes(factor(year), Emissions)) + 
    geom_bar(stat="identity") + 
    facet_wrap(~type, nrow=2, ncol=2) + 
    labs(x = "Year") + 
    labs(y = "PM2.5 (tons)") + 
    labs(title = "Total Emission of PM2.5 in Balitmore, MD per Type of Emission")

print(emissions_plot)

dev.off()
