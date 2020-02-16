## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
## plot4 ##
motor <- filter(SCC, grepl("Motor", SCC.Level.Three))
NEI_motor <- group_by(filter(NEI[NEI$fips == 24510,], SCC %in% motor$SCC), year)
plot_data5 <- summarise(NEI_motor, Emissions = sum(Emissions))
p <- ggplot(plot_data5, aes(x = year, y = Emissions))
p + geom_line() + labs(title = "Motor Vehicle emisssion in Baltimore City")