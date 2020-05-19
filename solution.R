setwd("D:/R/Project/readingquiz")
library(httr)
library(httpuv)
library(jsonlite)
oauth_endpoints("github")
mp <- oauth_app("github",key="66dd8a149c606fab9b01",secret = "d6a7b2116b2c60e03401609e5e4217d1d37eaa7a")
si <- oauth2.0_token(oauth_endpoints("github"),mp)
2
tkn <- config(token=si)
req <- GET("https://api.github.com/users/jtleek/repos",tkn)
stop_for_status(req)
jsn <- content(req)
jsn2 <- jsonlite::fromJSON(toJSON(jsn))
jsn2[jsn2$full_name=="jtleek/datasharing","created_at"]
#[1] "2013-11-07T13:25:07Z"


rm(list=ls())
install.packages("sqldf")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile = "./survey.csv")
acs <- read.csv("survey.csv")
# Answer: 
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")


# Answer
sqldf("select distinct AGEP from acs")

rm(list=ls())
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(con)
close(con)
nchar(htmlcode[10])
nchar(htmlcode[20])
nchar(htmlcode[30])
nchar(htmlcode[100])
# Answer 45 31 7 25


rm(list=ls())
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
read <- readLines(url)
#read.fwf is used to read a table of fixed witdth formatted data into a Data Frame
df <- read.fwf("./forfile.for",widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum(df[,4])
# Answer 32426.7

# skip =4 is for skipping the first 4 lines
#It works like: -1 -> leaves one blank(if you open the .for file in n++, you will see the space before 03JAN1990),
#9 -> length of the date, -5 -> leaves 5 blank, 4 ->takes the first Nino1+2 SST input, 4 -> takes the second Nino1+2
#SST input and so on. And lastly:- sum(df[, 4]) ---> to calculate the sum of 4th column