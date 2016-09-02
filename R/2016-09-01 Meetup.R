# Installing packages
install.packages(c('openintro','OIdata','devtools','ggplot2','psych','reshape2',
				   'knitr','markdown','shiny'))
devtools::install_github("jbryer/IS606")

library(IS606)

# Starting a lab
getLabs()
startLab('Lab0')

# Dual Scales
shiny_demo('DualScales', package='IS606')
