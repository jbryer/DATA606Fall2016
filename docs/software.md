---
layout: page
title: Software
permalink: /software/
---

We will make use of [R](http://r-project.org), an open source statistics program and language. Be sure to [install R](http://cran.r-project.org/) and [RStudio](http://rstudio.com) on your own computers within the first few days of the class.

* R - [Windows](http://cran.r-project.org/bin/windows/base/) or [Mac](http://cran.r-project.org/bin/macosx/)
* RStudio - [Download Windows or Mac version from here](http://www.rstudio.com/products/rstudio/download/)
* LaTeX - [Windows use MiKTeX](http://miktex.org/) or [Mac use MacTeX](https://tug.org/mactex/) (it is best to use Safari to download this file as Chrome or Firefox will often fail)

If using Windows, you also need to download and install these:

* [RTools](http://cran.r-project.org/bin/windows/Rtools/)
* [ActivePerl](http://www.activestate.com/activeperl/downloads/thank-you?dl=http://downloads.activestate.com/ActivePerl/releases/5.16.3.1603/ActivePerl-5.16.3.1603-MSWin32-x86-296746.msi)

Once everything is installed, execute the following command in RStudio to install the packages we will use for this class (you can copy-and-paste):

```
install.packages(c('openintro','OIdata','devtools','ggplot2','psych','reshape2',
				   'knitr','markdown','shiny'))
devtools::install_github("jbryer/IS606")
```

#### The `IS606` R Package

Many of the course resouces are available in the `IS606` R package. Here are some command to get started:

```
library('IS606')          # Load the package
vignette(package='IS606') # Lists vignettes in the IS606 package
vignette('os3')           # Loads a PDF of the OpenIntro Statistics book
data(package='IS606')     # Lists data available in the package
getLabs()                 # Returns a list of the available labs
viewLab('Lab0')           # Opens Lab0 in the default web browser
startLab('Lab0')          # Starts Lab0 (copies to getwd()), opens the Rmd file
shiny_demo()              # Lists available Shiny apps
```


#### Learning R

* [Quick-R](http://statmethods.net). Kabakoff's website. Great reference along with his book, *R in Action*.
* [O'Reilly Try R](http://tryr.codeschool.com/). Great tutorial on R where you can try R commands directly from the web browser.
* [R Reference Card](http://cran.r-project.org/doc/contrib/Short-refcard.pdf)
* [Video Overview of RStudio](http://vimeo.com/97166163)
* [R-Bloggers](http://www.r-bloggers.com/)
* [Journal of Statistical Software](http://www.jstatsoft.org/)
* [The R Journal](http://journal.r-project.org/)
* [An Introduction to Statistical Learning with Applications in R](http://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf)

#### Learning R Markdown

* [Video on RMarkdown by RStudio](http://vimeo.com/94181521) - This 26 minute video talks about some updates to RMarkdown.
* [Markdown Basics](http://daringfireball.net/projects/markdown/basics). Markdown is a way of formatting plain text documents mostly for the web. However, it has become for other writing tasks too. It has become popular because it focusses on writing and not formatting. The formatting is taken care later. The [Markdown Basics](http://daringfireball.net/projects/markdown/basics) provides a nice introduction to Markdown.
* [The R Markdown Website](http://rmarkdown.rstudio.com/) has a nice introduction on how Markdown is extended to allow for the inclusion of R code and output.
* [Video Introduction to R Markdown](https://www.youtube.com/watch?v=cFe1UJrj7lc). This short video (under 4 minutes) was recorded with an older version, so not all of the features and dialog boxes will look the same, but may be helpful.

#### Creating Math Equations

Occasionally you will need to type equations in homework and labs. R Markdown supports LaTeX style equations using the [MathJax](https://www.mathjax.org/) javascript library. I do not expect you to learn LaTeX for this course. Instead, I recommend using the free application [Daum Equation Editor](). It availabe [online](https://www.mathjax.org/), as a [Google Chrome Extension](https://chrome.google.com/webstore/detail/daum-equation-editor/dinfmiceliiomokeofbocegmacmagjhe?hl=en), or as a standalone [Mac Application](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&cad=rja&uact=8&ved=0CC4QFjACahUKEwiegvqQod3GAhUCmYAKHctnA5M&url=https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Fdaum-equation-editor%2Fid540665783%3Fmt%3D12&ei=WGKmVZ72DIKyggTLz42YCQ&usg=AFQjCNH69beGYAfr5ojnPILLNOG-goN9sw&sig2=Qw7QV80X8gZjrNyY9PkMHA). For more details, go to this page: [http://github.com/jbryer/IS606Spring2016/Pages/Equations.md](https://htmlpreview.github.io/?https://github.com/jbryer/IS606Spring2016/blob/master/Pages/Equations.html)
