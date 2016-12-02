library(IS606)
shiny_demo('BayesBilliards', package='IS606')

n_draw <- 100000
n_fish <- sample(20:250, n_draw, replace = TRUE)
head(n_fish, n=10)

hist(n_fish, main="Prior Distribution")

pick_fish <- function(n_fish) { # The generative model
	fish <- rep(0:1, c(n_fish - 20, 20))
	sum(sample(fish, 20))
}

pick_fish(20)
pick_fish(21)
pick_fish(40)

n_marked <- rep(NA, n_draw)
for(i in 1:n_draw) {
	n_marked[i] <- pick_fish(n_fish[i])
}
head(n_marked, n=10)

post_fish <- n_fish[n_marked == 5]
head(post_fish)
length(n_fish)
length(post_fish)
length(post_fish) / length(n_fish)
hist(post_fish, main='Posterior Distribution')
median(post_fish)
IQR(post_fish)

abline(v=median(post_fish), col='red')
abline(v=quantile(post_fish, probs=c(.25, .75)), col='green')
