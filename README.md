
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
  sub_df = anorexia[ anorexia$Postwt < 80 , c("Prewt", "Postwt"), drop = FALSE]
  sub_df2 = anorexia[ anorexia$Prewt > 70.25,]
  print(head(disk_usage(anorex.1, full_data = anorexia)))
  print(head(du(anorex.1, sub_df, sub_df2,
                full_data = anorexia)))
}
#>      Treat Prewt Postwt
#> [1,]     1     1      1
#> [2,]     1     1      1
#> [3,]     1     1      1
#> [4,]     1     1      1
#> [5,]     1     1      1
#> [6,]     1     1      1
#>       Treat     Prewt    Postwt
#> 1 0.6666667 0.6666667 0.6666667
#> 2 0.6666667 0.6666667 0.6666667
#> 3 0.6666667 0.6666667 0.6666667
#> 4 0.6666667 0.6666667 0.6666667
#> 5 0.6666667 1.0000000 1.0000000
#> 6 0.6666667 1.0000000 1.0000000
```

# Known Issues

The way things are found to be “used” is it is joined with the full data
set. If the new subsetted object (e.g. `data.frame`) is not unique, then
the join will fail as it does some extra checking.
