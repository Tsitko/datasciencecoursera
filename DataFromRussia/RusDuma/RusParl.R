#True - false vector shows if the deputat is in fraction
isInFract<-function(Fract,data){
count<-0
res<-rep(FALSE,length(data$Fraction));
for (i in data$Fraction){
 count=count+1
 if (i==Fract){res[count]<-TRUE}
}
res
}
#Taking only deputats from given fraction
depByFract<-function(Fract,data){
  res<-data[isInFract(Fract,data),]
  res
}
#Average deputat by fraction - the deputat who votes
# "yes"(1) if majority of his fraction votes "yes"
# "no"(-1) if majority of his fraction votes "no"
# "neitral"(0) if majority of his fraction votes "neitral"
# was absent (2) if majority of his fraction was absent
avgDeputat<-function(Fract,data){
  Dep<-rep(0,length(data[1,]))
  Dep[1]<-Fract
  Dep[2]<-Fract
  voteRes<-c(-1,0,1,2)
  
  subs<-depByFract(Fract,data)
  for (i in 3:(length(subs[1,])-2)){
    counter<-rep(0,4)
    for (j in 1:(length(subs[,1]))){
         subs[j,i]
         for (k in 1:length(voteRes)){
           if (subs[j,i]==voteRes[k]){
             counter[k]=counter[k]+1
           }
         }
    }
    for (k in 1:length(voteRes)){
      if (max(counter)==counter[k]){
        Dep[i]<-voteRes[k]
      }
      }

  }
  Dep
}

#Get Deputat by id(1:449)
getDep<-function(id,data){
  res<-data[id,1:(length(data)-2)]
  colnames(res)<-colnames(data)[1:(length(data)-2)]
  res
}

#The similarity of Deputats (proportion of similar votes)
depSim<-function(dep1,dep2){
  votes<-0
  counter<-0
  res<-0
  for (i in 3:(length(dep1))){
    if(dep1[i]!="2" & dep2[i]!="2"){
    votes=votes+1;
    if(dep1[i]==dep2[i]){
      counter=counter+1
    }
    }
  }
  if (votes!=0){
  res<-(counter/votes)
  }
  res
}