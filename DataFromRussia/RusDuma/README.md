#Summary
Here you can find an information on russian paliament 500 votings and analyse it to find the similarity in deputats
(so we call the members of our parliament) votings, fractions similarity and the similarity between deputats and fractions:
* VoteRes.txt
* RusParl.R
#VoteRes.txt
##Structure
The column names are:
* Name - the name of the deputat
* Fraction - the name of fraction
* Links to votes -  results of deputats voting for every vote
###Name
It's of course in russian
###Fraction
* EDRO - United Russia
* KPRF - The Communist Party of the Russian Federation (yes, we still have it :) )
* LDPR - Liberal Democratic Party of the Russian Federation
* SR - Fair Russia
###The results of the votes
* -1 - negative vote
* 0 - abstained
* 1 - positive vote
* 2 - was absent
##How to load it in R
data<-read.csv("VoteRes.txt",sep=";")
#RusParl.R
The functions are:
* isInFract(FractionName,data)
* depByFract(FractionName,data)
* avgDeputat(FractionName,data)
* getDep(id,data)
* depSim(deputat1,deputat2)
##isInFract
Input: 
FractionName, data from VoteRes.txt
Output: 
True - false vector shows if the deputat is in fraction
##depByFract
Input: 
FractionName, data from VoteRes.txt
Output: 
Information about voting of the deputats from given fraction
##avgDeputat
Input: 
FractionName, data from VoteRes.txt
Output: 
Average deputat by fraction - the deputat who votes:
* positive (1) if majority of his fraction votes positive
* negative (-1) if majority of his fraction votes negative
* abstained (0) if majority of his fraction votes abstained
* was absent (2) if majority of his fraction was absent
##getDep
Input: 
Deputat id, data from VoteRes.txt
Output: 
Information about voting of the deputat with given id
##depSim
Input: 
Information about voting of the deputat1 and deputat2
Output: 
The similarity of Deputats (proportion of similar votes)
