# 1) Create Train And Test Subsets From The Iris Dataset
library(datasets)
data("iris")
sub_data = subset(iris, Species == "setosa" | Species == "versicolor")[1:100,]
library(caTools)
sub_data$spl=sample.split(sub_data,SplitRatio=0.5)
train = subset(sub_data, sub_data$spl==TRUE)
test = subset(sub_data, sub_data$spl==FALSE)


# 2) Perform Logistic Regression
y = test$Species
x = test$Sepal.Length
glfit = glm(y~x, family = 'binomial')
summary(glfit)


# 3) Perform Prediction Using The Trained Model
newdata = data.frame(x = train$Sepal.Length)
predicted_val = predict(glfit, newdata, type="response")
prediction = data.frame(train$Sepal.Length, train$Species, predicted_val)
prediction



# 4) Plot A gplot For The Model
library(ggplot2)
qplot(prediction[,1], round(prediction[,3]), col=prediction[,2], xlab = 'Sepal Length', ylab = 'Prediction using Logistic Reg.')



