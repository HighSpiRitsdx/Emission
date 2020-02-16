## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot1 ##
library(dplyr)
NEI_year <- group_by(NEI, year)
plot_data1 <- summarise(NEI_year, sum(Emissions))
plot(plot_data1, type = "o", pch = 19, cex = 0, xaxt = "n", ylab = "Emissions", main = "Emissions from 1999 to 2008")
axis(1, c(1999,2002,2005,2008))

## plot2 ##
plot_data2 <- summarise(NEI_year[NEI_year$fips == 24510,], sum(Emissions))
plot(plot_data2, type = "o", pch = 19, cex = 0, xaxt = "n", ylab = "Emissions", main = "Emissions from 1999 to 2008 (Baltimore City)")
axis(1, c(1999,2002,2005,2008))

## plot3 ##
library(ggplot2)
plot_data3 <- summarise(group_by(NEI[NEI$fips == 24510,], type, year), Emissions = sum(Emissions))
p <- ggplot(plot_data3, aes(x = year, y = Emissions))
p + geom_line(aes(color = type))

## plot4 ##
coal <- filter(SCC, grepl("Coal", Short.Name))
NEI_coal <- group_by(filter(NEI, SCC %in% coal$SCC), year)
plot_data4 <- summarise(NEI_coal, Emissions = sum(Emissions))
p <- ggplot(plot_data4, aes(x = year, y = Emissions))
p + geom_line() + labs(title = "Coal related emisssion")

## plot5 ##
motor <- filter(SCC, grepl("Motor", SCC.Level.Three))
NEI_motor <- group_by(filter(NEI[NEI$fips == 24510,], SCC %in% motor$SCC), year)
plot_data5 <- summarise(NEI_motor, Emissions = sum(Emissions))
p <- ggplot(plot_data5, aes(x = year, y = Emissions))
p + geom_line() + labs(title = "Motor Vehicle emisssion in Baltimore City")

## plot6 ##
motor <- filter(SCC, grepl("Motor", SCC.Level.Three))
NEI_motor <- group_by(filter(NEI[NEI$fips %in% c("24510", "06037"),], SCC %in% motor$SCC), fips, year)
plot_data6 <- summarise(NEI_motor, Emissions = sum(Emissions))
p <- ggplot(plot_data6, aes(x = year, y = Emissions))
p + geom_line(aes(color = fips)) + labs(title = "Motor Vehicle emisssion compare") + scale_colour_discrete(name = "", breaks = c("24510", "06037"), labels = c("Baltimore City", "Los Angeles County")) + theme(legend.position = "bottom")
