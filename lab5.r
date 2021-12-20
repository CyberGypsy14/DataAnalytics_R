#(i) Load The Iris Dataset
library(datasets)
str(iris)

#(ii) Get First 10 Rows Of Each Subset
subset(iris, Species == "setosa")[1:10,]

subset(iris, Species == "versicolor")[1:10,]

subset(iris, Species == "virginica")[1:10,]

#(iii) Get The Summary Of The Iris Dataset 
summary(iris)


#(iv) Perform Correlation Among Variables 
corr <- cor(iris[,1:4])
round(corr,3)


#(v) Create A Model That Predicts The Species From The Petal And Sepal Width And Length 
library(C50)
input <- iris[,1:4]
output <- iris[,5]
model1 <- C5.0(input, output, control = C5.0Control(noGlobalPruning = TRUE,minCases=1))
plot(model1, main="C5.0 Decision Tree - Unpruned, min=1")


#(vi) Change Tree Parameters
model2 <- C5.0(input, output, control = C5.0Control(noGlobalPruning = FALSE))
plot(model2, main="C5.0 Decision Tree - Pruned")

