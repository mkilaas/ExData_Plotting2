##     Exploratory Data Analysis - Project 2
#     Following function loads the required data sets NEI and SCC

loadFiles <- function() {
  ## If the rds input files are not present, download them
  if(!file.exists("summarySCC_PM25.rds") | !file.exists("Source_Classification_Code.rds")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileUrl, method="curl", destfile="NEI_data.zip")
    unzip("NEI_data.zip")
  }
  ## Load NEI Data
  
  if(!exists("NEI")) {
    assign("NEI", readRDS("summarySCC_PM25.rds"), envir = .GlobalEnv)
  }
  ## SCC data frame is not already loaded, load it
  if(!exists("SCC")) {
    assign("SCC", readRDS("Source_Classification_Code.rds"), envir = .GlobalEnv)
  }
}


loadFiles()



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