makeX<-function(x,n)
{
if (n==1)
{
  X<-x
}
if(n>=2)
{
  X<-x^n
  for (i in (n-1):1)
  {
    X<-cbind(X,(x^i))
  }
}
if(n>0)
{
  X<-cbind(X,rep(1,length(x)))
}
else
{
  X<-rep(1,length(x))
}
X
  
}
findCoef<-function(X,y)
{
  XTX<-t(X)%*%X
  Coef<-try(solve(XTX),silent=TRUE)
  if (typeof(Coef)!="character")
  {
    Coef<-Coef%*%t(X)%*%y
  }
  Coef
}
polynom<-function(x,y,n=2)
{
  if(length(x)!=length(y))
  {
    stop("sets sizes doesn't match")
  }
  X<-makeX(x,n)
  if(length(dim(X))>1)
  {
  for (i in 1:length(X[,1]))
  {
    mn<-mean(X[i,])
    X[i,]<-(X[i,])/mn
    y[i]<-y[i]/mn
  }
  }
  Coef<-findCoef(X,y)
  if (typeof(Coef)=="character")
  {
    Coef
  }
  else
  {
  rn<-rep("",length(Coef))
  for (i in 1:length(Coef))
  {
    rn[i]=paste0("X^",(length(Coef)-i))
  }
  colnames(Coef)<-"Coefficients"
  rownames(Coef)<-rn
  Coef
  }
}
findDelta<-function(x,y,Coef)
{
  X<-makeX(x,length(Coef)-1)
  delta<-sum(abs((X%*%Coef)-y))
  delta
}

#finding best interpolation polynomial for given x and y
# where y=f(x)
# minN - the lowest power of the polynomial checked
# maxN - the higest power of the polynomial checked
bestPolynom<-function(x,y,minN=0,maxN=10)
{
  bestDelta<-Inf
  bestCoef<-"char"
  for (i in minN:maxN)
  {
    Coef<-polynom(x,y,i)
    if (typeof(Coef)!="character")
    {
      Delta<-findDelta(x,y,Coef)
      if (Delta<bestDelta)
      bestCoef<-Coef
      bestDelta<-Delta
    }
  }
  if (typeof(bestCoef)!="character")
  {
    bestCoef
  }
  else
  {
    stop("Can't find any polynom")
  }
}
#plotting the initial data an the best interpolation polynomial
plotPolynom<-function(x,y,Coef)
{
  n<-length(Coef)
  if (n>1)
  {
  poly<-makeX(x,n-1)%*%Coef
  }
  else
  {
    poly<-Coef
  }
  plot(x,y,xlab="",ylab="")
  par(new=T)
  plot(x,poly,xlab="",ylab="",type="l")
}
