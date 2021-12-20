#Read File "testfile.csv" 
setwd('/home/aryan/Documents/R')
df = read.csv("testfile.csv") 

#Creating the list 
lst1 = list() 
for(i in 1:ncol(df)) {     
  lst1[[i]] <- df[ , i]   
}
arr = array(unlist(lst1), dim = c(15,3))
print(arr)
plot(arr[,1],arr[,2])

#Create a LinePlot B Against A 

A = arr[,1] 
B = arr[,2] 
plot(A, B, type = 'b', lty = 2, pch = 19, col = "red", xlab = 'A', ylab = 'B') 

#Adding legend to our plot 

legend(1, 200,legend = c("Line Plot B Against A"), col = c("red"), lty = 2, cex = 0.9, title = "Line Plot", text.font = 6, bg = 'gray') 




#4) Compute D = (col B + col C)/(col A) 

#Compute D 
C = arr[,3] 
D = (B + C) / A 



#5) Provide linePlot D against A 

#LinePlot D Against A 

plot(A, D, type = 'b', lty = 2, pch = 19, col = "blue", xlab = 'A', ylab = 'D') 

#Adding legend to our plot 

legend(1, 200,legend = c("Line Plot D Against A"), col = c("blue"), lty = 2, cex = 0.9, title = "Line Plot", text.font = 6, bg = 'gray') 



#Part  2--- Write newly added column to a csv file (should contact column A, B, C, D) 

#Write newly added column to a csv file 

write.table(A, file = "output.csv", sep = ",",append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE) 

write.table(B, file = "output.csv", sep = ",",append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE) 

write.table(C, file = "output.csv", sep = ",",append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE) 

write.table(D, file = "output.csv", sep = ",",append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE) 