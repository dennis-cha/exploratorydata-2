# Exploratory Data Analysis Course Project 2
# Plot 2

# Load data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset & aggregate
emissions_baltimore <- subset(NEI,fips=='24510')
emissions_by_year <- aggregate(Emissions ~ year, data=emissions_baltimore, FUN=sum)

# Generate the graph
png(filename='plot2.png')

barplot(emissions_by_year$Emissions / 1000,
        names.arg=emissions_by_year$year,
        main='Total Emission of PM2.5 in Baltimore, MD',
        xlab='Year', ylab='PM2.5 (kilotons)')

dev.off()
