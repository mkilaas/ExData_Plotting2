## Plot data
library(ggplot2)
q3 <- aggregate(Emissions ~ year + type, data=NEI[NEI$fips=="24510",], sum)
plot3 <- qplot(year, Emissions, data=q3, color=type, geom="path", xlab="Year", ylab="Emissions (in tons)", main="Emissions by type in Baltimore City")
ggsave(plot3, file="plot3.png", width=4, height=4)
