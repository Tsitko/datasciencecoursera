# Summary
Generating given number of market depths for given price, standart deviations (for prices and depths)

# Content

Script:

* depths.R

Output examples:

* Quotes.csv
* BID.csv
* ASK.csv
* QuotesVol.csv
* BIDVol.csv
* ASKVol.csv

##depths.R

Quotes function:

Quotes((n=100,price=100,percent=2,deep=10,e=0.5,file="Quotes.csv", 
                 BIDASK=FALSE, BIDFile="Bid.csv", ASKFile="Ask.csv",
                 maxVol=10, minVol=1, QuotesVolFile="QoutesVol.csv",
                 BIDVolFile="BIDVol.csv",ASKVolFile="ASKVol.csv"))
                 
  
  * n - nubmer of depths
  * price - average stock price
  * percent - standart diviation for stock (%)
  * deep - deep of depth
  * e - standart diviation in depths (%)
  * file - file for quotes
  * BIDASK - make separate files for BID and ASK
  * BIDFile - file for BIDs
  * ASKFile - file for ASKs
  * maxVol - maximum volume in depth
  * minVol - minimum volume in depth
  * QoutesVolFile - file for qoutes volumes
  * BIDVolFile - file for BID volumes
  * ASKVolFile - file for ASK volumes

## Output examples
Examples of outputs for default values:

Quotes() and Qoutes(BIDASK=TRUE)
