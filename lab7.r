#Load Iris Dataset
library(datasets)
data("iris")
#Install Other Packages
library(ggplot2)
library(GGally)
#Create GG Pairs For Whole Iris Dataset
ggpairs(iris)
#Create GG Pairs For Only First 4 Columns
ggpairs(iris, columns = 1:4)
#Create Subset Of 2 Species By Taking First 100 Rows. From This 100 Randomly Take 50 Rows As Training Set And Take 50 Rows As Test Set
sub_data = subset(iris, Species == "setosa" | Species == "versicolor")[1:100,]
library(caTools)
sub_data$spl=sample.split(sub_data,SplitRatio=0.5)
train = subset(sub_data, sub_data$spl==TRUE)
test = subset(sub_data, sub_data$spl==FALSE)
#Do ggpairs() For Both Test And Training
ggpairs(train, columns = 1:5)
ggpairs(test, columns = 1:5)