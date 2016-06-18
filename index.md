---
title       : Data Products Course Project Presentation
subtitle    : GaltonApp - Height of the Child According on his Parents' Heights
author      : João A. Silva
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## Overview

* This project was built as part of the course Developing Data Products course. The Developing Data Products course is part of the Coursera Data Sciene Specialization

* The app developed for the first part of the assignment is avalilable at: https://joaosilva.shinyapps.io/GaltonApp/

* Source code for ui.R and server.R files, as well the code for this presentation are available on the GitHub repo: https://github.com/joao-a-silva/DataProductsCourseProject

--- 

## Web Apllication Functionality

* The site provides a tool for predict the height of the child according on his parents' heights

* The predictions are made based on the GaltonFamilies dataset.


--- 

## Galbon Dataset

* The GaltonFamilies dataset available in R, and can be loaded with the code below:


```r
library(HistData)
data(GaltonFamilies)
```

* Some informations about the dataset:


```r
names(GaltonFamilies)
```

```
## [1] "family"          "father"          "mother"          "midparentHeight"
## [5] "children"        "childNum"        "gender"          "childHeight"
```

```r
dim(GaltonFamilies)
```

```
## [1] 934   8
```

---
## The application

  <img width="100%" height ="110%" src="assets/img/app" alt="">





