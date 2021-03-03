
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `du`

<!-- badges: start -->

[![R-CMD-check](https://github.com/muschellij2/du/workflows/R-CMD-check/badge.svg)](https://github.com/muschellij2/du/actions)
<!-- badges: end -->

The goal of `du` is to implement the data usage metric.

## Installation

You can install the released version of du from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("du")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("muschellij2/du")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(du)
```

``` r
if (requireNamespace("MASS", quietly = TRUE)) {
  utils::data(anorexia, package = "MASS")

  anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
                  family = gaussian, data = anorexia[ anorexia$Prewt > 70.25,])
  disk_usage(anorex.1, full_data = anorexia)
}
#>       Treat Prewt Postwt
#>  [1,]  TRUE  TRUE   TRUE
#>  [2,]  TRUE  TRUE   TRUE
#>  [3,]  TRUE  TRUE   TRUE
#>  [4,]  TRUE  TRUE   TRUE
#>  [5,]  TRUE  TRUE   TRUE
#>  [6,]  TRUE  TRUE   TRUE
#>  [7,]  TRUE  TRUE   TRUE
#>  [8,]  TRUE  TRUE   TRUE
#>  [9,]  TRUE  TRUE   TRUE
#> [10,]  TRUE  TRUE   TRUE
#> [11,]  TRUE  TRUE   TRUE
#> [12,]  TRUE  TRUE   TRUE
#> [13,]  TRUE  TRUE   TRUE
#> [14,]  TRUE  TRUE   TRUE
#> [15,]  TRUE  TRUE   TRUE
#> [16,]  TRUE  TRUE   TRUE
#> [17,]  TRUE  TRUE   TRUE
#> [18,]  TRUE  TRUE   TRUE
#> [19,]  TRUE  TRUE   TRUE
#> [20,]  TRUE  TRUE   TRUE
#> [21,]  TRUE  TRUE   TRUE
#> [22,]  TRUE  TRUE   TRUE
#> [23,]  TRUE  TRUE   TRUE
#> [24,]  TRUE  TRUE   TRUE
#> [25,]  TRUE  TRUE   TRUE
#> [26,]  TRUE  TRUE   TRUE
#> [27,]  TRUE  TRUE   TRUE
#> [28,]  TRUE  TRUE   TRUE
#> [29,]  TRUE  TRUE   TRUE
#> [30,]  TRUE  TRUE   TRUE
#> [31,]  TRUE  TRUE   TRUE
#> [32,]  TRUE  TRUE   TRUE
#> [33,]  TRUE  TRUE   TRUE
#> [34,]  TRUE  TRUE   TRUE
#> [35,]  TRUE  TRUE   TRUE
#> [36,]  TRUE  TRUE   TRUE
#> [37,]  TRUE  TRUE   TRUE
#> [38,]  TRUE  TRUE   TRUE
#> [39,]  TRUE  TRUE   TRUE
#> [40,]  TRUE  TRUE   TRUE
#> [41,] FALSE FALSE  FALSE
#> [42,]  TRUE  TRUE   TRUE
#> [43,]  TRUE  TRUE   TRUE
#> [44,]  TRUE  TRUE   TRUE
#> [45,]  TRUE  TRUE   TRUE
#> [46,]  TRUE  TRUE   TRUE
#> [47,]  TRUE  TRUE   TRUE
#> [48,]  TRUE  TRUE   TRUE
#> [49,]  TRUE  TRUE   TRUE
#> [50,]  TRUE  TRUE   TRUE
#> [51,]  TRUE  TRUE   TRUE
#> [52,]  TRUE  TRUE   TRUE
#> [53,]  TRUE  TRUE   TRUE
#> [54,]  TRUE  TRUE   TRUE
#> [55,]  TRUE  TRUE   TRUE
#> [56,]  TRUE  TRUE   TRUE
#> [57,]  TRUE  TRUE   TRUE
#> [58,]  TRUE  TRUE   TRUE
#> [59,]  TRUE  TRUE   TRUE
#> [60,]  TRUE  TRUE   TRUE
#> [61,]  TRUE  TRUE   TRUE
#> [62,]  TRUE  TRUE   TRUE
#> [63,]  TRUE  TRUE   TRUE
#> [64,]  TRUE  TRUE   TRUE
#> [65,]  TRUE  TRUE   TRUE
#> [66,]  TRUE  TRUE   TRUE
#> [67,]  TRUE  TRUE   TRUE
#> [68,]  TRUE  TRUE   TRUE
#> [69,]  TRUE  TRUE   TRUE
#> [70,]  TRUE  TRUE   TRUE
#> [71,]  TRUE  TRUE   TRUE
#> [72,]  TRUE  TRUE   TRUE
```
