# Using 'Cut' Function
## Method: 1
set.seed(700)

clientID <- round(runif(200,min=2000, max=3000),0)
orders <- round(runif(200,min=1, max=50),0)

df <- df <- data.frame(cbind(clientID,orders))

ApplyQuintiles <- function(x) {
  cut(x, breaks=c(quantile(df$orders, probs = seq(0, 1, by = 0.20))), 
      labels=c("0-20","20-40","40-60","60-80","80-100"), include.lowest=TRUE)
}
df$Quintile <- sapply(df$orders, ApplyQuintiles)
table(df$Quintile)

##Method: 2
library(OneR)
set.seed(700)

clientID <- round(runif(200, min = 2000, max = 3000), 0)
orders <- round(runif(200, min = 1, max = 50), 0)
df <- data.frame(cbind(clientID, orders))

df$Quintiles <- bin(df$orders, method = "content")
table(df$Quintile)