## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
## plot4 ##
motor <- filter(SCC, grepl("Motor", SCC.Level.Three))
NEI_motor <- group_by(filter(NEI[NEI$fips %in% c("24510", "06037"),], SCC %in% motor$SCC), fips, year)
plot_data6 <- summarise(NEI_motor, Emissions = sum(Emissions))
p <- ggplot(plot_data6, aes(x = year, y = Emissions))
p + geom_line(aes(color = fips)) + labs(title = "Motor Vehicle emisssion compare") + scale_colour_discrete(name = "", breaks = c("24510", "06037"), labels = c("Baltimore City", "Los Angeles County")) + theme(legend.position = "bottom")
