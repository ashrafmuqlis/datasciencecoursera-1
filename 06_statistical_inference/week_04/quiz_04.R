# Question 1
a <- 12
s <- 4
n <- 100
error <- qt(0.95,df=n-1)*s/sqrt(n)
lower <- a-error
upper <- a+error
lower
upper

# Quesiton 2
deltas <- c(140-132, 138-135, 150-151, 148-146, 135-130)
mean(deltas)
sd(deltas)
t.test(deltas)

# Question 3
a <- 1100
s <- 30
n <- 9
error <- qt(0.975,df=n-1)*s/sqrt(n)
lower <- a-error
upper <- a+error
c(lower, upper)

# Question 4
# Perform a hypothesis test on the proportion p=0.5 or p<>0.5. This can be done using pbinom.
pbinom(q=2,size=4,prob=0.5, lower.tail=FALSE)

# Question 5
# Test using a poisson distribution, ppois() function.
n <- 10
lamb <- (1/100)*1787
ppois(q=n-1, lambda=lamb)

# using the standard computation for a test statistic and approximating with normal distribution.
n <- 1787
p_hat <- 10/1787
p <- 1/100
std_error <- sqrt((p*(1-p))/n)
TS <- (p_hat-p)/std_error
pnorm(TS)


# Question 6
X_bar <- -3
Y_bar <- 1
X_sd <- 1.5
Y_sd <- 1.8
n_X <- 9
n_Y <- 9
md <- X_bar - Y_bar
sp <- sqrt(((n_X-1) *X_sd^2 + (n_Y-1)*Y_sd^2)/(n_X + n_Y - 2))
md + c(-1, 1) * qt(0.975, n_X+n_Y-2)*sp*sqrt(1/n_X + 1/n_Y)

TS <- md/(sp*sqrt(1/n_X + 1/n_Y))
2*pt(q=-abs(TS), df=n_X+n_Y-2)

# Question 7
# We need to know the distribution and parameters which were used in the confidence calculation.
# Hence we cannot tell.

# Question 8
# use the standard formulae for computing the power 1 - beta
power.t.test(n=100, delta=0.01, sd=0.04, sig.level= 0.05, type="one.sample", alt="one.sided")$power

# Question 9
# Use the power.t.test function in R to compute the required sample size.
power.t.test(power=0.9, delta=0.01, sd=0.04, sig.level= 0.05, type="one.sample", alt="one.sided")$n

# Question 10
# The power will increase as the type one error increases.

# Question 11
X_bar <- 44
Y_bar <- 42.04
X_sd <- 12
Y_sd <- 12
n_X <- 288
n_Y <- 288
md <- X_bar - Y_bar
sp <- sqrt(((n_X-1)*X_sd^2 + (n_Y-1)*Y_sd^2)/(n_X + n_Y - 2))
md + c(-1, 1) * qt(0.975, n_X+n_Y-2)*sp*sqrt(1/n_X + 1/n_Y)

TS <- md/(sp*sqrt(1/n_X + 1/n_Y))
2*pt(q=-abs(TS), df=n_X+n_Y-2)

# Question 12
# Use Bonferroni correction divide by number of different tests.


