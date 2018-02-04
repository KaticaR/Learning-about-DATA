

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCSub<-SCC[grep("Coal",SCC$SCC.Level.Three),]
SCCSub<-SCCSub[grep("Combustion",SCCSub$SCC.Level.One),]

sources<-SCCSub[,1]

neiS<-subset(NEI,SCC %in% sources)

neiS1<-subset(neiS,neiS$year==1999)
neiS2<-subset(neiS,neiS$year==2002)
neiS3<-subset(neiS,neiS$year==2005)
neiS4<-subset(neiS,neiS$year==2008)

mn1<-with(neiS1,tapply(Emissions,fips,mean))
mn2<-with(neiS2,tapply(Emissions,fips,mean))
mn3<-with(neiS3,tapply(Emissions,fips,mean))
mn4<-with(neiS4,tapply(Emissions,fips,mean))

d1<-data.frame(state=names(mn1),mean=mn1)
d2<-data.frame(state=names(mn2),mean=mn2)
d3<-data.frame(state=names(mn3),mean=mn3)
d4<-data.frame(state=names(mn4),mean=mn4)

mrg<-merge(d1,d2,by="state")
mrg<-merge(mrg,d3,by="state")
mrg<-merge(mrg,d4,by="state")
names(mrg)<-c("state","mean.1999","mean.2002","mean.2005","mean.2008")

png(file="plot4.png",width = 1000, height = 700)

plot(rep(1999,2330),mrg[,2],xlim = c(1998,2009),xlab = "Year",
     ylab = "Average emission")

points(rep(2002,2330),mrg[,3])
points(rep(2005,2330),mrg[,4])
points(rep(2008,2330),mrg[,5])

with(mrg,segments(rep(1999,2330),mrg[,2],rep(2002,2330),mrg[,3],col = state))
with(mrg,segments(rep(2002,2330),mrg[,3],rep(2005,2330),mrg[,4],col = state))
with(mrg,segments(rep(2005,2330),mrg[,4],rep(2008,2330),mrg[,5],col = state))

title(main = "Change of emission from coal combustion-related sources \nacross the United States")

dev.off()

##by Sergio Molina

# Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

# Generate the graph in the same directory as the source code
png(filename='~/Exploratory_Data_Analysis/Assignment_2/plot4.png')

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

dev.off()