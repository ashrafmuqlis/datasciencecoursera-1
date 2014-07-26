# Question 1
# Use First derivative test from calculus to solve first derivative equal to zero.
#
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
mu_hat <- sum(w*x)/sum(w)

# Question 2
# Use the formula from the lecture slides.
#
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
beta_1_hat <- sum(y*x)/sum(x*x)

# Question 3
# Use lm(mpg ~ wt) on the data(mtcars) and get the coefficients.
#
data(mtcars)
linear_regression <- lm(mpg~wt, data=mtcars)

# Question 4
# sd(X) = 0.5*sd(Y) and cor(Y,X) = 0.5. Using formula from lecture slides
# beta_1_hat = cor(Y,X)*[sd(Y)/sd(X)] 
# beta_0_hat = mean(Y) - beta_1_hat*mean(X)

# Question 5
# test_2 = cor(test_1,test_2)*test_1
#
test_2 <- 0.4*1.5

# Question 6
#  Normalise the following vector of sample values to std normal
# 
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
x_normed <- (x - mean(x))/sd(x)

# Question 7
# Using the data set from question 2 what is the intercept from the linear regression.
# 
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
linear_regression <- lm(y~x)

# Question 8
# From the formula in question 4 the estimator for the intercept beta_0_hat equals zero.
#

# Question 9
#
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)

# Question 10
#
# var(Y)/var(X) using the standard formula for slope estimators and 
# correlation = cov(Y,X)/sd(Y)*sd(X) 
