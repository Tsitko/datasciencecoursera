#Summary
A very simple recommender system
#Content
* Recom.R
##Recom.R
Function recommend(data,uId=1)

* data - data.frame with 2 columns (user Ids and product Ids) representing which products were bought by which users.

* uId - Id of the user for which you want to receive recommendations.

The recommendation will be the data.frame with 2 columns (product Ids and score). 
The score shows how many times other users who have bought the same (at least one) products as our user (uId), 
have bought each product form table. 
For products which our user have already bought , score=0.
