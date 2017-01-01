# Exploratory Data Analysis Course Project 2
# Plot 5

# Load data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)

# Subset NEI for mortor vehicles in Baltimore
emissions_baltimore <- subset(NEI,fips=='24510' & type=='ON-ROAD')

# Aggregate
emissions_by_year <- aggregate(Emissions ~ year, data=emissions_baltimore, FUN=sum)

# Generate the graph
png(filename='plot5.png')

# Plot
barplot(emissions_by_year$Emissions,
        names.arg=emissions_by_year$year,
        main='Total Emission of PM2.5 from Motor Vehicles in Baltimore, MD',
        xlab='Year', ylab='PM2.5 (tons)')

dev.off()

