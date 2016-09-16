# Installs the package, needed only once per R installation
#devtools::install_github('jbryer/IS606')

file.exists('README.md')
getwd()

library(IS606)

available.packages()
search() # List loaded packages

getLabs()

getwd()

startLab('Lab2')

coins <- c('H','T')

sample(coins, 1)
sample(coins, 2)

