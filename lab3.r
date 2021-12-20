setwd('/home/aryan/Documents/R')
# 1.Read file
library("xlsx")
df <- read.xlsx(file = "samplefile.xlsx", sheetIndex = 1, sheetName = "Sheet1")

# 2.Add a column to compute net Revenue
df$Revenue = (df$Sugar.production.in.tonnes * df$Production.Cost.per.tonne)+((df$Margin/100)*(df$Sugar.production.in.tonnes * df$Production.Cost.per.tonne))
print(df)

# 3.Plot a histogram of year vs sugar production in tonnes
library(ggplot2)
ggplot(df,aes(Year,Sugar.production.in.tonnes)) + geom_bar(stat = "identity",position = "dodge", col="black") + ggtitle("Year vs Sugar Prediction")

# 4.Find average, median of sugar production in tonnes
print(paste("Average of Sugar.production.in.tonnes = ", mean(df$Sugar.production.in.tonnes)))
print(paste("Median of Sugar.production.in.tonnes = ", median(df$Sugar.production.in.tonnes)))

# 5.Find average, median of revenue
print(paste("Average of Revenue = ", mean(df$Revenue)))
print(paste("Median of Revenue = ", median(df$Revenue)))

# 6.Perform a linear regression in one variable of revenue vs sugar production in tonnes
x <- df$Revenue
y <- df$Sugar.production.in.tonnes
plot(x,y, col="blue", xlab="Revenue", ylab="Sugar Prediction", main="Revenue & Sugar Prediction Regression")
abline(lm(y~x), col="Red")
relation<-(lm(y~x))
a<-data.frame(x=15000)
result<-predict(relation,a)
print(paste("Suagr Production if Revenue is 15000 =",result)) 

# 7.Perform a linear regression in one variable of revenue vs production cost per tonne
x <- df$Revenue
y <- df$Production.Cost.per.tonne
plot(x,y, col="blue", xlab="Revenue", ylab="Production Cost", main="Revenue & Production Cost Regression")
abline(lm(y~x), col="Red")
relation<-(lm(y~x))
a<-data.frame(x=15000)
result<-predict(relation,a)   
print(paste("Production Cost if Revenue is 15000 =",result))

# 8.Do a line plot of revenue vs year
x <- df$Revenue
y <- df$Year
plot(x, y, type = "b", xlab = "Revenue", ylab = "Year", pch = 19, col = "Blue", lwd= 2.0, main="Revenue vs Year")