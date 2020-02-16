## load data ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
## plot4 ##
coal <- filter(SCC, grepl("Coal", Short.Name))
NEI_coal <- group_by(filter(NEI, SCC %in% coal$SCC), year)
plot_data4 <- summarise(NEI_coal, Emissions = sum(Emissions))
p <- ggplot(plot_data4, aes(x = year, y = Emissions))
p + geom_line() + labs(title = "Coal related emisssion")