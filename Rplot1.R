## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot1 ##
library(dplyr)
NEI_year <- group_by(NEI, year)
plot_data1 <- summarise(NEI_year, sum(Emissions))
plot(plot_data1, type = "o", pch = 19, cex = 0, xaxt = "n", ylab = "Emissions", main = "Emissions from 1999 to 2008")
axis(1, c(1999,2002,2005,2008))