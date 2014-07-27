## plot
png(file="plot4.png")
par(mfcol=c(1,1))
## Find indices which match Coal Combustion in SCC 
pattern = "comb.*coal"
ind <- grep(pattern, SCC$EI.Sector, ignore.case=TRUE) 
## Get the SCC codes for Coal Combustion
sccs <- SCC[ind, 1]
## Get indices in NEI which match the SCC codes for Coal Combustion
scci <- NEI$SCC %in% sccs
## Get subset of NEI and do calculate sum of Emissions by year
NEIsubset <- NEI[scci, c("Emissions", "year")]
q4 <- aggregate(Emissions ~ year, data=NEIsubset, sum)
## Plot data
plot(q4$year, q4$Emissions, type="l", main="Coal Combustion Emissions in United States", xlab="Year", ylab="Emissions (in tons)")
dev.off()