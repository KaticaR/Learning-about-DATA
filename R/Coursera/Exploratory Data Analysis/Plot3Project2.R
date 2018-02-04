
library(ggplot2)
library(ggpubr)

NEI <- readRDS("summarySCC_PM25.rds")

NEI$year<-factor(NEI$year)

nei1t<-subset(NEI,NEI$type=="POINT" & NEI$fips=="24510")
nei2t<-subset(NEI,NEI$type=="ON-ROAD" & NEI$fips=="24510")
nei3t<-subset(NEI,NEI$type=="NONPOINT" & NEI$fips=="24510")
nei4t<-subset(NEI,NEI$type=="NON-ROAD" & NEI$fips=="24510")

a <- ggplot(data=nei1t,aes(x=year,y=Emissions,fill=year))
a <- a + geom_boxplot(alpha=0.2) 
a <- a + theme_bw(base_family = "serif")
a <- a + scale_y_continuous(name = "Emission for POINT type",
                            breaks = seq(0, 60, 10),
                            limits=c(0, 60))
a <- a + labs(fill = "Year",x="Year")
a <- a + ggtitle("Decrease of emission on POINT type with a peak in 2005")


b <- ggplot(data=nei2t,aes(x=year,y=Emissions,fill=year))
b <- b + geom_boxplot(alpha=0.2) 
b <- b + theme_bw(base_family = "serif")
b <- b + scale_y_continuous(name = "Emission for ON-ROAD type",
                            breaks = seq(0, 1, .2),
                            limits=c(0, 1))
b <- b + labs(fill = "Year",x="Year")
b <- b + ggtitle("Increase of emission on ON-ROAD type after 1999")


c <- ggplot(data=nei3t,aes(x=year,y=Emissions,fill=year))
c <- c + geom_boxplot(alpha=0.2) 
c <- c + theme_bw(base_family = "serif")
c <- c + scale_y_continuous(name = "Emission for NONPOINT type",
                            breaks = seq(0, 70, 10),
                            limits=c(0, 70))
c <- c + labs(fill = "Year",x="Year")
c <- c + ggtitle("Decrease of emission on NONPOINT type")


d <- ggplot(data=nei4t,aes(x=year,y=Emissions,fill=year))
d <- d + geom_boxplot(alpha=0.2) 
d <- d + theme_bw(base_family = "serif")
d <- d + scale_y_continuous(name = "Emission for NON-ROAD type",
                            breaks = seq(0, .25, .05),
                            limits=c(0, .25))
d <- d + labs(fill = "Year",x="Year")
d <- d + ggtitle("Decrease of emission on NON-ROAD type with a peak in 2008")

png(file="plot3.png",width = 800, height = 480)

ggarrange(a,b,c,d,ncol = 2,nrow = 2)

dev.off()

##by Stephen A. Escott

NEIBalt<-subset(NEI,NEI$fips=="24510")

## Then create a plot that compares source types and shows relative change by plotting
## a regression line for each source type. Log10 of data is used to better define the comparison.

library(ggplot2)

plot3<-ggplot(NEIBalt,aes(year, log10(Emissions), color=type))+ geom_point(shape=19,alpha=1/4) +scale_colour_hue(l=50) + geom_smooth(method=lm, se=FALSE,fullrange=TRUE) + ggtitle("Baltimore City PM2.5 Emissions by \nSource Type 1999 - 2008") + ylab ("PM2.5 Emissions (log10)")
print(plot3)
