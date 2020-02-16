## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
## plot2 ##
plot_data2 <- summarise(NEI_year[NEI_year$fips == 24510,], sum(Emissions))
plot(plot_data2, type = "o", pch = 19, cex = 0, xaxt = "n", ylab = "Emissions", main = "Emissions from 1999 to 2008 \n(Baltimore City)")
axis(1, c(1999,2002,2005,2008))