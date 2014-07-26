# Question 1
data(mtcars)
fit <- lm(mpg~factor(cyl) + wt, data=mtcars)
summary(fit)
# Answer: correct
# 4 cylinders factor variable is used as the base reference and the estimate for 
# expected change is -6.0709 mpg comparing 8 cylinders to 4 cylinders.

# Question 2
data(mtcars)
fit1 <- lm(mpg~factor(cyl) + wt, data=mtcars)
fit2 <- lm(mpg~factor(cyl), data=mtcars)
summary(fit1)
summary(fit2)
# Answer: Holding weight constant, cylinder appears to have 
# less of an impact on mpg than if weight is disregarded.

# Question 3
data(mtcars)
fit1 <- lm(mpg~factor(cyl) + wt, data=mtcars)
fit2 <- update(fit1, mpg~factor(cyl) + wt + wt*factor(cyl))
summary(fit1)
summary(fit2)
# Answer:
# The P-value is larger than 0.05. So, according to our criterion, 
# we would fail to reject, which suggests that the interaction terms may not be necessary. correct

# Question 4
data(mtcars)
fit <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit)
# The estimated expected change in MPG per one ton increase in 
# weight for the particular number of cylinders (8, 6, 4).

# Question 5
# Give the hat diagonal for the most influential point.
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y~x)
influence.measures(fit)
# Answer: 0.9946 correct

# Question 6
# Give the slope dfbeta for the point with the highest hat value.
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y~x)
influence.measures(fit)
# Answer: -134 correct

# Question 7
# Consider a regression relationship between Y and X with and without 
# adjustment for a third variable Z. Which of the following is true 
# about comparing the regression coefficient between Y and X with 
# and without adjustment for Z.
# Answer: 
# It is possible for the coefficient to reverse sign after adjustment. 
# For example, it can be strongly significant and positive before adjustment 
# and strongly significant and negative after adjustment. correct

