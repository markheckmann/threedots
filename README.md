
<!-- README.md is generated from README.Rmd. Please edit that file -->

# threedots

<!-- badges: start -->

![](https://img.shields.io/badge/language-R-blue)
![](https://img.shields.io/badge/status-experimental-yellow)
<!-- badges: end -->

Modify the dots (`...`) directly inside a function body.

## Installation

You can install the development version of threedots like so:

``` r
remotes::install_github("markheckmann/threedots")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(threedots)

foo <- \(...) {
  s(a = NULL, b = 999, c = "new") # remove a, change b, add c
  list(...)
}

foo(a = 1, b = 2)
#> $b
#> [1] 999
#> 
#> $c
#> [1] "new"
```
