set.seed(2112)
sample(1:100, 1)
sample(1:100, 1)

set.seed(1234)
nums <- sample(1:100, 1000, replace=TRUE)
plot(1:length(nums), nums)
