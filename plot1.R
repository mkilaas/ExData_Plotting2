## Plot data
png(file="plot1.png")
par(mfcol=c(1,1))
q1 <- aggregate(Emissions ~ year, data=NEI, sum)
plot(q1$year, q1$Emissions, type="l", main="Total Emissions in United States", xlab="Year", ylab="Emissions (in tons)")
dev.off()