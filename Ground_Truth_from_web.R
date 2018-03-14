rm(list=ls(all=TRUE))

# Load libraries
library(httr)
library(jsonlite)

# Set directory path
setwd("C:/Users/Downloads/TextMining/MovieReview_Data")
datareview=read.csv("Movie_Review_Data.csv") # Load the dataset

# Get review tag (positive/negative/neutral) from the website
# website used: "http://text-processing.com/api/sentiment/"
reviewo=vector()
for (i in c(1:2000))
{
k=paste("text=",as.String(datareview$text[i]),sep = "")
#str_replace_all(k, "[^[:alnum:]]", " ")
#paste("text=", k, sep="")
#k=gsub("[[:punct:]]", " ", k)
resp <- POST(
  url = "http://text-processing.com/api/sentiment/",
  body= k
)

# Write output label
outputr=fromJSON(rawToChar(resp$content))
reviewo=c(reviewo,outputr$label)
}
