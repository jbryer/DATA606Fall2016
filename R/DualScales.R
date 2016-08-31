# tl;dr - DO NOT USE DUAL SCALES!

# This script is meant to play with dual scales using the dualplot function
# described in the two blog posts below. This is the foundation for a shiny app.

# http://ellisp.github.io/blog/2016/08/28/dualaxes2
# http://ellisp.github.io/blog/2016/08/18/dualaxes

library(dplyr)
library(tidyr)
library(quantmod) # for getSymbols for share price data
library(ggseas)   # for nzbop data
library(reshape2)

# The dualplot() function:
source("https://gist.githubusercontent.com/ellisp/4002241def4e2b360189e58c3f461b4a/raw/9ab547bff18f73e783aaf30a7e4851c9a2f95b80/dualplot.R")

fonterra <- getSymbols('FCG.NZ', src='yahoo', auto.assign = FALSE)
bhp <- getSymbols('BHP.AX', src='yahoo', auto.assign = FALSE)

# default - a cross over point happen at the earliest point of the shorter series
dualplot(x1 = time(bhp), y1 = bhp$BHP.AX.Close,
		 x2 = time(fonterra), y2 = fonterra$FCG.NZ.Close,
		 ylab1 = "BHP", ylab2 = "Fonterra",
		 legx = "topright", main = "Price per share of two key firms")


library(readxl)

download.file("http://www.rbnz.govt.nz/-/media/ReserveBank/Files/Statistics/Key%20graphs/graphdata.xlsx?la=en",
			  destfile = "rbnz.xlsx", mode = "wb")

# Import some of that data into R and create a numeric TimePeriod variable from the original
# string that shows year and month:
forex <- read_excel("rbnz.xlsx", sheet = "8_NZDUSD", skip = 4) %>%
	mutate(year = as.numeric(substring(DATE, 1, 4)),
		   month = as.numeric(substring(DATE, 6, 7)),
		   TimePeriod = year + (month - 0.5) / 12) %>%
	select(-DATE, -year, -month)

# Tidy up names:
names(forex)[1:2] <- c("NZDUSD", "TWI")

# Create a long, thin ("tidy") version for use with ggplot2:
forex_m <- forex %>%  gather(variable, value, -TimePeriod)

# Set the basic foundation of the coming ggplot graphics:
basicplot <- ggplot(forex_m, aes(x = TimePeriod, y = value, colour = variable)) +
	labs(x = "", caption = "Data from RBNZ; graphic by http://ellisp.github.io", colour = "")

with(forex, dualplot(x1 = TimePeriod, y1 = NZDUSD, y2 = TWI,
					 colgrid = "grey90",
					 ylim1 = c(0, 1),
					 ylim2 = c(20, 200)))

cor.test(forex$NZDUSD, forex$TWI)

ggplot(forex, aes(x=NZDUSD, y=TWI)) + geom_point()

forex$NZDUSD.z <- (forex$NZDUSD - mean(forex$NZDUSD)) / sd(forex$NZDUSD)
forex$TWI.z <- (forex$TWI - mean(forex$TWI)) / sd(forex$TWI)

cor.test(forex$NZDUSD.z, forex$TWI.z)

ggplot(forex, aes(x=NZDUSD.z, y=TWI.z)) + geom_point()

forex.melted.z <- melt(forex[,c('TimePeriod','NZDUSD.z', 'TWI.z')], id.vars='TimePeriod')
forex.melted <- melt(forex[,c('TimePeriod','NZDUSD', 'TWI')], id.vars='TimePeriod')

ggplot(forex.melted, aes(x=value)) + geom_density() +
	facet_wrap(~ variable, ncol=1, scales='free')

z.mapping <- data.frame(z = seq(-2, 2, by=.5), NZDUSD = NA, TWI = NA)
z.mapping$NZDUSD <- mean(forex$NZDUSD) + z.mapping$z * sd(forex$NZDUSD)
z.mapping$TWI <- mean(forex$TWI) + z.mapping$z * sd(forex$TWI)

ggplot(forex.melted.z, aes(x=TimePeriod, y=value, group=variable, color=variable)) +
	geom_line() + ylab('Z-Score') +
	scale_y_continuous(breaks = z.mapping$z,
					   labels = paste0('z-score = ', z.mapping$z,
					   				   '\nNZDUSD = ', round(z.mapping$NZDUSD, digits=2),
					   				   '\nTWI = ', round(z.mapping$TWI, digits=2)))

dualplot(x1 = forex$TimePeriod,
		 y1 = forex$NZDUSD,
		 y2 = forex$TWI,
		 colgrid = "grey90",
		 ylim1 = c(0, 1),
		 ylim2 = c(0, 200))

forex$diff <- forex$NZDUSD - forex$TWI
forex$diff.z <- forex$NZDUSD.z - forex$TWI.z
ggplot(forex, aes(x=TimePeriod, y=diff)) + geom_path()
ggplot(forex, aes(x=TimePeriod, y=diff.z)) + geom_hline(yintercept=0, alpha=0.5) + geom_path()
