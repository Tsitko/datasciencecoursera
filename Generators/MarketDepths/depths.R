makeQuotes<-function(n,price,percent)
{
  quotes<-rnorm(n,price,(price*percent/100))
  quotes
}
plotQuotes<-function(data)
{
  plot(1:length(data),data,xlab="time",ylab="price",type="l")
}
makeDepths<-function(data,deep,e)
{
  Depths<-matrix(0,ncol=length(data),nrow=deep)
  for(i in (1:length(data)))
  {
    Depth<-makeQuotes(deep,data[i],e)
    Depth<-sort(Depth,decreasing=TRUE)
    for (j in (1:deep))
    {
      Depths[j,i]<-Depth[j]
    }
    
  }
  Depths

}
getVols<-function(n,deep,maxVol,minVol)
{
  Vols<-matrix(0,ncol=n,nrow=deep)
  for (i in 1:n)
  {
    Vol<-sample(minVol:maxVol,deep,replace=TRUE)
    for (j in 1:deep)
    {
      Vols[j,i]<-Vol[j]
    }

  }
  Vols
}
Quotes<-function(n=100,price=100,percent=2,deep=10,e=0.5,file="Quotes.csv", 
                 BIDASK=FALSE, BIDFile="Bid.csv", ASKFile="Ask.csv",
                 maxVol=10, minVol=1, QuotesVolFile="QoutesVol.csv",
                 BIDVolFile="BIDVol.csv",ASKVolFile="ASKVol.csv")
{
  x<-makeQuotes(n,price,percent)
  data<-makeDepths(x,deep,e)
  Vols<-getVols(n,deep,maxVol,minVol)
  if(BIDASK==FALSE)
  {
    write.csv(data,file)
    write.csv(Vols,QuotesVolFile)
  }
  else
  {
    write.csv(data[1:round(deep/2),],BIDFile)
    write.csv(Vols[1:round(deep/2),],BIDVolFile)
    write.csv(data[(1+round(deep/2)):deep,],ASKFile)
    write.csv(Vols[(1+round(deep/2)):deep,],ASKVolFile)
  }
  plotQuotes(x)
}