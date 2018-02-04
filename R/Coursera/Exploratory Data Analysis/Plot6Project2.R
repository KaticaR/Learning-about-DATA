

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


SCCSub<-SCC[grep("Motor Vehicle",SCC$SCC.Level.Three),]
sources<-SCCSub[,1]
neiS<-subset(NEI,(NEI$fips=="24510" | NEI$fips=="06037") & NEI$SCC %in% sources)

png(file="plot6.png",width = 600, height = 500)

par(bg="azure2")
with(neiS,plot(year,Emissions,
               xlab = "",ylab = "",
               type="n",bty="n",xaxt="n",yaxt="n",
               ylim = c(5,80),
               xlim = c(1998,2009)))

with(neiS,segments(c(1999,2002,2002,2005),c(61.42,64.28,10.17,64.28),
                   c(2002,2005,2005,2008),c(64.28,64.28,10.17,64.73),col = fips))

with(neiS,points(c(2002,2005),
                 Emissions[fips=="24510"],
                 col="red",pch=17,lwd=4))
with(neiS,points(c(1999,2002,2005,2008),
                 Emissions[fips=="06037"],
                 col="darkgreen",pch=17,lwd=4))

title(main = "Change of emission in Baltimore City and Los Angeles County \nfrom motor vehicle sources")
with(neiS,text(c(1999+.05,2002,2002,2005,2005,2008-.05),
               Emissions+5,
               labels = as.character(round(Emissions,2))))
with(neiS,text(c(1999+.05,2002,2002,2005,2005,2008-.05),
               Emissions-5,
               labels = as.character(year)))

legend(x=1998.1,y=38,
       legend = c("Los Angeles County","Baltimore City"),
       col=c("darkgreen","red"),
       pch=c(17,17),
       bg="khaki1")

dev.off()

##by Stephen A. Escott

NEIBaltLAC<-subset(NEI,NEI$fips=="24510" | NEI$fips=="06037")

## Filter that data for Motor Vehicles
NEIBaltLACMV<-subset(NEIBaltLAC, NEIBaltLAC$type=="ON-ROAD")

## Change dataframe to CREATE MORE UNDERSTANDABLE CHART LEGEND LABELS
## Change column name "fips" TO "Location"
colnames(NEIBaltLACMV)[1] <-"Location"
## Change fips numbers to location names
NEIBaltLACMV[NEIBaltLACMV=="24510"]<-"Balt City"
NEIBaltLACMV[NEIBaltLACMV=="06037"]<-"LA Cnty"

## Plot using log10 of Emissions data to better visualize steeper decline of Baltimore City (24510 fips)
plot6<-ggplot(NEIBaltLACMV,aes(year, log10(Emissions), color=Location))+ geom_point(shape=19,alpha=1/4) +scale_colour_hue(l=50) + geom_smooth(method=lm, se=FALSE,fullrange=TRUE) + ggtitle("Comparison of Baltimore City and LA County\nMotor Vehicle PM2.5 Emissions 1999 - 2008") + ylab ("PM2.5 Emissions (log10)")
print(plot6)

