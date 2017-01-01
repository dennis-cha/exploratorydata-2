# Exploratory Data Analysis Course Project 2
# Plot 4

# Load data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)

# Subset SCC for coal
SCC.coal <- SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE),]

# Merge data set
mergedData <- merge(NEI, SCC.coal, by="SCC")
emissions_by_year <- aggregate(Emissions ~ year, data=mergedData, FUN=sum)

# Generate the graph
png(filename='plot4.png')

# Plot
barplot(emissions_by_year$Emissions / 1000,
        names.arg=emissions_by_year$year,
        main='Total Emission of PM2.5 from Coal',
        xlab='Year', ylab='PM2.5 (kilotons)')

dev.off()

