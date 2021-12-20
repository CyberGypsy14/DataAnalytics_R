# Get Predictions From Pruned Tree
yt.tree <- predict(tree.boston, newdata=Boston[-train,])
boston.test <- Boston[-train,"medv"]


# Construct Plot Of Observed Values (X-Axis) Vs Predicted Values (Y-Axis) - Write Code To Plot
plot(boston.test, yt.tree)
abline(0,1)


mean((boston.test - yt.tree)^2)