#
# -- Modifying ... on the fly --
#
# see: https://stackoverflow.com/a/79039311/536198
#
# It is possible to access ... using get (see here) or env$... and also replace
# the <...> object (albeit not directly). Hence, we could create a getter (g)
# and setter (s) function for .... Behind the scenes, a conversion from ... to
# a list still occurs, but we won't see it as a user and have a simple interface
# for updating ....
#
.get_dots <- function(envir) {
  assign("...", envir$...)
  list(...)
}


#' Modify `...` on the fly
#'
#' Modify the dots (`...`) directly.
#' @example inst/examples/example-modify-dots.R
#' @export
#' @rdname modify-dots
#'
g <- function(x, .envir = NULL) {
  x <- deparse(substitute(x))
  .envir <- .envir %||% parent.frame()
  dots <- .get_dots(.envir)
  dots[[x]]
}


#' @export
#' @rdname modify-dots
s <- function(...) {
  envir <- parent.frame()
  dots <- modifyList(.get_dots(envir), list(...))
  do.call(function(...) { # create new <...> object and replace in caller env
    assign("...", environment()$..., envir = envir)
  }, dots)
}
