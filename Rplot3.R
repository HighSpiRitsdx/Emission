## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
## plot3 ##
plot_data3 <- summarise(group_by(NEI[NEI$fips == 24510,], type, year), Emissions = sum(Emissions))
p <- ggplot(plot_data3, aes(x = year, y = Emissions))
p + geom_line(aes(color = type)) + labs(title = "Emission types in Baltimore City")