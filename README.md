
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

The common way to modify the dots and pass them to another function is
to use `do.call` ([see
here](https://stackoverflow.com/questions/34159520/modifying-dots-inside-a-function)):

``` r
plot2 <- \ (...) {
    dots <- list(...)
    dots$type = 'l'
    do.call(plot, dots)
}

x <- sample(1:10)
plot(x)
plot2(x)
```

`{threedots}` allows to modify the dots directly via `modify_dots()`. It
is basically just syntactic sugar for the `do.call` approach above.

``` r
library(threedots)

plot3 <- \ (...) {
    modify_dots(type = 'l')
    plot(...)
}

plot3(x)
```
