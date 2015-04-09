recomend<-function(data,uId=1)
{
        users<-split(data,data[,1])
        userProds<-users[uId][[1]][,2]
        userProds<-unique(userProds)
        pIds<-unique(data[,2])
        coef<-rep(0,length(pIds))
        RecomendationTable<-data.frame(pIds,coef)
        toCheck<-data.frame(unique(data[,1]),rep(1,length(unique(data[,1]))))
        for(prod in userProds)
        {
                prods<-split(data,data[,2])
                prodUsers<-prods[prod][[1]][,1]
                prodUsers<-unique(prodUsers)
                if(sum(toCheck[,2]>0))
                {
                for(user in prodUsers)
                {
                        if (toCheck[which(toCheck[,1]==user),2]==1)
                        {
                        toCheck[which(toCheck[,1]==user),2]<-0
                        Prods<-split(data,data[,1])
                        Prods<-Prods[user][[1]][,2]
                        Prods<-unique(Prods)
                        for (i in 1:length(Prods))
                        {
                                if(sum(userProds==Prods[i])==0)
                                {
                                        RecomendationTable[which(RecomendationTable$pIds
                                                                  ==Prods[i]),2]<- 
                                                RecomendationTable[which(RecomendationTable$pIds
                                                                         ==Prods[i]),2]+1
                                }
                        }
                        }
                        
                }
                }
                
        }
        RecommenderTable<-
                RecommenderTable[order(RecommenderTable[,2],decreasing=T),]
        
        RecommenderTable
}