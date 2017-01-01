# Exploratory Data Analysis Course Project 2
# Plot 6

# Load data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)

# Subset NEI for mortor vehicles in Baltimore
emissions_data <- subset(NEI,type=='ON-ROAD'&(fips=='24510'|fips=='06037'))

# Aggregate
emissions_compare <- aggregate(Emissions ~ year + fips, data=emissions_data, FUN=sum)
emissions_compare$fips <- gsub('24510','Baltimore',emissions_compare$fips)
emissions_compare$fips <- gsub('06037','Los Angeles',emissions_compare$fips)
colnames(emissions_compare) <- c('Year','Location','Emissions')

# Plot
png(filename='plot6.png')

# Plot
emissions_plot <- ggplot(emissions_compare, aes(factor(Year), Emissions)) + 
    geom_col() + 
    geom_label(aes(label=round(Emissions,0)),vjust=-0.2) + 
    facet_wrap(~Location, nrow=1, ncol=2) + 
    labs(x = "Year") + 
    labs(y = "PM2.5 (tons)") + 
    labs(title = "Total Emission of PM2.5 from Motor Vehicle in Balitmore vs. Los Angeles")
    
print(emissions_plot)

dev.off()