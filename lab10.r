# http://lib.stat.cmu.edu/datasets/boston
library(MASS)    # For Boston data
options(scipen = 4)  # Suppresses scientific notation
View(Boston) 

set.seed(1)
train <- sample(1:nrow(Boston), nrow(Boston)/2)
tree.boston <- tree(medv ~ . ,Boston,subset=train)
summary(tree.boston)

# Run CV to find best level at which to prune
cv.boston <- cv.tree(tree.boston)
# Construct a plot (dev = MSE on y-axis)
plot(cv.boston$size,cv.boston$dev,type='b')


# Prune the tree, display pruned tree
prune.boston <- prune.tree(tree.boston,best=5)
plot(prune.boston)
text(prune.boston,pretty=0)