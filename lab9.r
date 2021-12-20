setwd('/home/aryan/Documents/R')
library(rjson)
library("xlsx")
library("ggplot2")
df = read.xlsx(file = "input9.xlsx", sheetIndex = 1, sheetName = "Sheet1")

# 1. Plot the variations across the years in a single plot. 
p1 <- ggplot() + geom_line(aes(y = Jan, x = Year),data = df)+ geom_line(aes(y = Feb, x = Year),data = df)+ geom_line(aes(y = Mar, x = Year), data = df)+ geom_line(aes(y = Apr, x = Year),data = df)+ geom_line(aes(y = May, x = Year),data = df)+ geom_line(aes(y = Jun, x = Year), data = df) + geom_line(aes(y = Jul, x = Year),data = df) + geom_line(aes(y = Aug, x = Year), data = df) + geom_line(aes(y = Sep, x = Year), data = df)+ geom_line(aes(y = Oct, x = Year), data = df) + geom_line(aes(y = Nov, x = Year), data = df) + geom_line(aes(y = Dec, x = Year),data = df)
p1

# median for every year
YearlyMedian = apply(df[, -1], 1, median)
print(YearlyMedian)

# 3. median is 10, remove values that deviate more than or less than 10 from median of 10
year1 = df[1, 2:13]
y1 = replace(year1, 15>year1 | year1>35, NA)
y1

year2 = df[2, 2:13]
y2 = replace(year2, 20>year2 | year2>40, NA)
y2

year3 = df[3, 2:13]
y3 = replace(year3, 24>year3 | year3>44, NA)
y3

year4 = df[4, 2:13]
y4 = replace(year4, 29>year4 | year4>49, NA)
y4

year5 = df[5, 2:13]
y5 = replace(year5, 29>year5 | year5>49, NA)
y5

# New df after removing outliers
df2 <- data.frame(
  Year = c(1979,1980,1981,1984,1985),
  Jan = c(y1[1,1],y2[1,1],y3[1,1],y4[1,1],y5[1,1]),
  Feb = c(y1[1,2],y2[1,2],y3[1,2],y4[1,2],y5[1,2]),
  Mar = c(y1[1,3],y2[1,3],y3[1,3],y4[1,3],y5[1,3]),
  Apr = c(y1[1,4],y2[1,4],y3[1,4],y4[1,4],y5[1,4]),
  May = c(y1[1,5],y2[1,5],y3[1,5],y4[1,5],y5[1,5]),
  Jun = c(y1[1,6],y2[1,6],y3[1,6],y4[1,6],y5[1,6]),
  Jul = c(y1[1,7],y2[1,7],y3[1,7],y4[1,7],y5[1,7]),
  Aug = c(y1[1,8],y2[1,8],y3[1,8],y4[1,8],y5[1,8]),
  Sep = c(y1[1,9],y2[1,9],y3[1,9],y4[1,9],y5[1,9]),
  Oct = c(y1[1,10],y2[1,10],y3[1,10],y4[1,10],y5[1,10]),
  Nov = c(y1[1,11],y2[1,11],y3[1,11],y4[1,11],y5[1,11]),
  Dec = c(y1[1,12],y2[1,12],y3[1,12],y4[1,12],y5[1,12])
)
df2

# 4.	Perform 1 again and comment on the pattern
p2 <- ggplot() + geom_line(aes(y = Jan, x = Year),data = df2)+ geom_line(aes(y = Feb, x = Year),data = df2)+ geom_line(aes(y = Mar, x = Year), data = df2)+ geom_line(aes(y = Apr, x = Year),data = df2)+ geom_line(aes(y = May, x = Year),data = df2)+ geom_line(aes(y = Jun, x = Year), data = df2) + geom_line(aes(y = Jul, x = Year),data = df2) + geom_line(aes(y = Aug, x = Year), data = df2) + geom_line(aes(y = Sep, x = Year), data = df2)+ geom_line(aes(y = Oct, x = Year), data = df2) + geom_line(aes(y = Nov, x = Year), data = df2) + geom_line(aes(y = Dec, x = Year),data = df2)
p2