setwd('/home/aryan/Documents/R')

#1) Read Json file (testfile) using R data frame
library("rjson")
input = fromJSON(file = "testfilelab4.json")
print(input)
df = as.data.frame(input)
df$ID <- as.numeric(sapply(strsplit(as.character(df$ID), ","), function(x) x[1]))
df$Salary <- as.numeric(sapply(strsplit(as.character(df$Salary), ","), function(x) x[1]))
df$Earnings <- as.numeric(sapply(strsplit(as.character(df$Earnings), ","), function(x) x[1]))


#2) Find Average Salary, Standard Deviation, Median For All Employees
print(paste("Average Salary For All Employees = ", mean(df$Salary, na.rm = TRUE)))
print(paste("Standard Deviation Of Salary For All Employees = ", sd(df$Salary, na.rm = TRUE)))
print(paste("Median Of Salary For All Employees = ", median(df$Salary, na.rm = TRUE)))


#3) Project 2 Year Salary Projection For Each Employee Where Salary Increases 10% On An Average Every Year
df$Year1_Salary = (df$Salary)+(df$Salary*0.10)
df$Year2_Salary = (df$Year1_Salary)+(df$Year1_Salary*0.10)
for (x in 1:25){
  print(paste("Second Year Salary Projection For Each Employee",x, " = ",df$Year2_Salary[x]))
}



#4) Express Earnings As A Percentage Of Salary For Each Employee
for (x in 1:25){
  print(paste("Earning As Percentage Of Salary For Employee",x, " = ",(df$Earnings[x] / df$Salary[x]) * 100,"%"))
}


#5) Plot A Linear Line Of Earnings Vs Salary
x = df$Salary
y = df$Earnings
plot(x,y, col="blue", xlab="Salary", ylab="Earnings", main="Earnings vs Salary Regression")
abline(lm(y~x), col="Red")



#6) Perform A Linear Regression Of Earnings Vs Salary
LRModel = lm(y~x, data = df)
summary(LRModel)



#7) Predict Earnings For Each Of Employee Salary Using The Model In #6 For Given Salary
dataSalary = as.data.frame(df$Salary)
df$Predicted_Earning = predict(LRModel, newdata = dataSalary)
df$Predicted_Earning


#8) Record Difference In Predicted Earnings Vs Actual Earnings
for (x in 1:25){
  print(paste("Difference in Predicted Earning vs Actual Earning of Employee",x, " = ", df$Predicted_Earning[x] - df$Earnings[x]))
}


