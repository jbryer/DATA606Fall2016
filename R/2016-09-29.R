library(IS606)
shiny_demo('CLT_mean')

n <- 1e5
pop <- runif(n, 0, 1)
mean(pop)

samp1 <- sample(pop, size=30)
mean(samp1); sd(samp1)
hist(samp1)

M <- 1000
samples <- numeric(length=M)
samples.sd <- numeric(length=M)
for(i in seq_len(M)) {
	tmp <- sample(pop, size=30)
	samples[i] <- mean(tmp)
	samples.sd[i] <- sd(tmp)
}
samples.se <- samples.sd / sqrt(30)

hist(samples)
mean(samples); sd(samples)
# SE
sd(samp1) / sqrt(length(samp1))

hist(samples.se - sd(samples))

