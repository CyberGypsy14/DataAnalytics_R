setwd('/home/aryan/Documents/R')
df = read.csv("testfile2.csv") 
head(df)
df$total_marks = rowSums(df[ , c(3:7)], na.rm=TRUE)

#The Average Of Subject 1, Subject 2, Subject 3, Subject 4, Subject 5
Avg_Subject1 = mean(df$Subject.1.Marks)
Avg_Subject2 = mean(df$Subject.2.Marks)
Avg_Subject3 = mean(df$Subject.3.Marks)
Avg_Subject4 = mean(df$Subject.4.Marks)
Avg_Subject5 = mean(df$Subject.5.Marks)	

#The Average Of The Total Marks
df$Subject_Average = rowMeans(df[,c(3:7)])


#Plot A Line Plot Of Average Marks For Each Student
x = (1:10)
plot(x, df$Subject_Average, type = "b", xlab = "Student", ylab = "Score", pch = 19, col = "Red", lwd= 2.0)
legend("topleft", legend=c("Subject Average Per Student"), fill = c("Red"))



#Add Median Of Subject Score For Each Student To The Line Plot
df$StudentScore_Median = apply(df[,3:7],1, median, na.rm = TRUE)
lines(x, df$StudentScore_Median, type = "b", pch = 21, col = "Blue", lwd = 2.0)


#List Of Students Who Have Scored More Than 90 in Average
df[which(df$Subject_Average > 90), ]

#List Of Students With DOB Greater Than 1-07-1990 and Status 'Active'
TempDf = subset(df, df$Date.of.Birth > "1990-07-01" & df$Active.Student == TRUE)



#Interquartile Deviation For Total Marks Column
print(summary(df$total_marks))
print(paste("Interquartile Deviation of Total Marks=", IQR(df$total_marks)))

#Put The Data Frame With Additional Column Back To Excel and Save
write.csv(df,"/home/aryan/Documents/R/output.csv", row.names = FALSE)