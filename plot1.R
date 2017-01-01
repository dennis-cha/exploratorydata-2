# Exploratory Data Analysis Course Project 2
# Plot 1

# Load data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate
emissions_by_year <- aggregate(Emissions ~ year, data=NEI, FUN=sum)

# Generate the graph
png(filename='plot1.png')

barplot(emissions_by_year$Emissions / 1000,
        names.arg=emissions_by_year$year,
        main='Total Emission of PM2.5',
        xlab='Year', ylab='PM2.5 (kilotons)')

dev.off()
