## Plot data
png(file="plot2.png")
par(mfcol=c(1,1))
q2 <- aggregate(Emissions ~ year, data=NEI[NEI$fips=="24510",], sum)
plot(q2$year, q2$Emissions, type="l", main="Total Emissions in Baltimore City", xlab="Year", ylab="Emissions (in tons)")
dev.off()
