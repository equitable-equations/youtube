# Goodness of fit testing example

obs <- c(12, 31, 36, 21)
exp_props <- dbinom(0:3, 3, .5)
exp_props
exp <- exp_props * 100
exp

chisq.test(obs, p = exp_props)

chi_stat <- sum((obs - exp)^2 / exp)
chi_stat

p <- 1 - pchisq(chi_stat, 3)
p
