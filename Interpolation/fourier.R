fourier<-function(x,a,b,a0)
{
        n<-length(a)
        res<-a0/2
        for (i in 1:n)
        {
              res<-res+a[i]*cos(i*x)+b[i]*sin(i*x)  
        }
        res
}
makeXfur<-function(x,n=5)
{
        l<-length(x)
        X<-matrix(0,nrow=l,ncol=n*2+1)
        X[,1]<-1/2
        for (i in 1:l)
                for (j in 2:(n*2+1))
                {
                        if (j%%2==0)
                        {
                                X[i,j]<-cos(x[i]*j)
                        }
                        else
                        {
                                X[i,j]<-sin(x[i]*j)   
                        }
                }
        X
}

findCoefFur<-function(X,y)
{
        XTX<-t(X)%*%X
        Coef<-try(solve(XTX),silent=TRUE)
        if (typeof(Coef)!="character")
        {
                Coef<-Coef%*%t(X)%*%y
        }
        Coef
}
Fur<-function(x,y,n=2)
{
        if(length(x)!=length(y))
        {
                stop("sets sizes doesn't match")
        }
        X<-makeXfur(x,n)

        if(length(dim(X))>1)
        {
                for (i in 1:length(X[,1]))
                {
                        mn<-mean(X[i,])
                        X[i,]<-(X[i,])/mn
                        y[i]<-y[i]/mn
                }
        }
        Coef<-findCoefFur(X,y)
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
        a0<-Coef[1]
        A<-getA(Coef)
        B<-getB(Coef)
        delta<-sum(abs(fourier(x,A,B,a0)-y))
        delta

}

#finding best fourier interpolation for given x and y
# where y=f(x)
# minN - the lowest n of the fourier decomposition checked
# maxN - the higest n of the fourier decomposition checked
bestFur<-function(x,y,minN=1,maxN=10)
{
        bestDelta<-Inf
        bestCoef<-"char"
        for (i in minN:maxN)
        {

                Coef<-Fur(x,y,i)
                if (typeof(Coef)!="character")
                {
                        Delta<-findDelta(x,y,Coef)
                        if (Delta<bestDelta)
                        { 
                                bestCoef<-Coef
                                bestDelta<-Delta
                        }
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

#plotting the initial data an the best fourier interpolation

plotFur<-function(x,y,Coef)
{
        n<-length(Coef)
        polyx<-sort(runif(1000,min(x),max(x)))
        if (n>1)
        {
                a0<-Coef[1]
                A<-getA(Coef)
                B<-getB(Coef)
                poly<-fourier(polyx,A,B,a0)
        }
        else
        {
                poly<-rep(Coef,1000)
        }
        plot(x,y,xlab="",ylab="")
        par(new=T)
        plot(polyx,poly,xlab="",ylab="",type="l")
}
getA<-function(Coef)
{
        n<-(length(Coef)-1)/2
        A<-rep(0,n)
        for (i in 1:length(Coef))
        {
                if (i%%2==0)
                {
                        A[i/2]=Coef[i]
                }
        }
        A
}
getB<-function(Coef)
{
        n<-(length(Coef)-1)/2
        B<-rep(0,n)
        for (i in 2:length(Coef))
        {
                if (i%%2!=0)
                {
                        B[i/2]=Coef[i]
                }
        }
        B
}