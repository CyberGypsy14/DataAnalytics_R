#1. Quick View The Iris Data
library(datasets)
head(iris, n=100)

#2. Check Structure Of Iris.
str(iris)
print(Sepal_Length)

#3. Determine The Relation Between Sepal.Length And Sepal.Width Using A Scatter Plot
SL = iris$Sepal.Length
SW = iris$Sepal.Width
plot(SL, SW, xlab = "Sepal Length", ylab = "Sepal Width", main = "Relation Between Sepal Length And Sepal Width")

#3. Determine The Relation Between Sepal.Length And Sepal.Width Using A Scatter Plot
SL = iris$Sepal.Length
SW = iris$Sepal.Width
plot(SL, SW, xlab = "Sepal Length", ylab = "Sepal Width", main = "Relation Between Sepal Length And Sepal Width")




#4. Determine The Relation Between Petal.Length And Petal.Width Using A Scatter Plot
PL = iris$Petal.Length
PW = iris$Petal.Width
plot(PL, PW, xlab = "Petal Length", ylab = "Petal Width", main = "Relation Between Petal Length And Petal Width")


#5. Perform Multi Regression Analysis By Setting Sepal.Length As Target Variable And Sepal.Width, Petal.Length, Petal.Width As Dependent Variables
#Check For Linearity Between The Dependent And Independent Variables
plot(SW, SL, ylab = "Sepal Length", xlab = "Sepal Width", main = "Linearity Between Sepal Length And Sepal Width")

plot(PL, SL, ylab = "Sepal Length", xlab = "Petal Length", main = "Linearity Between Sepal Length And Petal Length")

plot(PW, SL, ylab = "Sepal Length", xlab = "Petal Width", main = "Linearity Between Sepal Length And Petal Width")

#Creating The Multi Regression Model
model <- lm(SL ~ SW + PL + PW)

summary(model)


#6. Obtain The Linear Multi Variate Equation. Find The Error In Prediction By Comparing Actual Sepal Length Against Predicted Sepal Length Using The Obtained Equation.
#Multi-Variate Equation Obtained By The Above Model
Sepal_Length = (Intercept) + (Sepal_Width_Coefficient) * X1 + (Petal_Length_Coefficient) * X2 + (Petal_Width_Coefficient) * X3
Sepal_Length = (1.856) + (0.651)*X1 + (0.709)*X2 + (-0.556)*X3
#Where, X1 = Value Of Sepal Width, X2 = Value Of Petal Length, X3 = Value Of Petal Width
# Predict Sepal Length Using Sepal Widtsh, Petal Length, Petal Width Values

#And If You Plug That Data Into The Regression Equatin You’ll Get:
  
Sepal_Length = (1.856) + (0.651)*(3.5) + (0.709)*(1.4) + (-0.556)*(0.2)


print(Sepal_Length)

