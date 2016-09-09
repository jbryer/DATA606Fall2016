library(IS606)
shiny_demo('gambler')

shiny_demo('lottery')

sample(c('H','T'), 2, replace=TRUE)
sample(c('H','T'), 2, replace=FALSE)

coins <- sample(c('H','T'), 1000, replace=TRUE)
table(coins)
prop.table(table(coins))


tickets <- as.data.frame(rbind(
	c(    '$1',    1,     15),
	c(    '$2',    2,     11),
	c(    '$4',    4,     62),
	c(    '$5',    5,    100),
	c(   '$10',   10,    143),
	c(   '$20',   20,    250),
	c(   '$30',   30,    562),
	c(   '$50',   50,   3482),
	c(  '$100',  100,   6681),
	c(  '$500',  500,  49440),
	c('$1500',  1500, 375214),
	c('$2500',  2500, 618000)
), stringsAsFactors=FALSE)
names(tickets) <- c('Winnings', 'Value', 'Odds')
tickets$Value <- as.integer(tickets$Value)
tickets$Odds <- as.integer(tickets$Odds)

odds <- sample(max(tickets$Odds), 356, replace=TRUE)
head(odds, n=20)
hist(odds)
vals <- rep(-1, length(odds))
for(i in 1:nrow(tickets)) {
	vals[odds %% tickets[i,'Odds'] == 0] <- tickets[i,'Value'] - 1 
}
head(vals, n=20)
mean(vals)
vals.cumsum <- cumsum(vals)
tail(vals.cumsum)

for(index in c('hello', 'class')) {
	print(index)
}

for(i in seq(3, 5)) {
	print(i)
}
