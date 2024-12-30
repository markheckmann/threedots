#
# -- Modifying ... on the fly --
#
# see: https://stackoverflow.com/a/79039311/536198
#
# It is possible to access ... using get (see here) or env$... and also replace
# the <...> object (albeit not directly). Hence, we could create a getter (g)
# and setter (s) function for ... . Behind the scenes, a conversion from ... to
# a list still occurs, but we won't see it as a user and have a simple interface
# for updating ... .


.get_dots <- function(envir) {
  assign("...", envir$...) # assign dots from envir to ... in current env
  list(...)
}


#' Modify `...` on the fly
#' Modify the dots (`...`) directly.
#' @param x Dots argument symbol.
#' @param .envir Environment to get values from. Defaults to parent environment.
#' @example inst/examples/example-modify-dots.R
#' @export
#' @rdname modify-dots
#'
. <- function(x, .envir = NULL) {
  x <- deparse(substitute(x))
  .envir <- .envir %||% parent.frame()
  dots <- .get_dots(.envir)
  dots[[x]]
}


#' @param ... The changed made to the dots.
#' @export
#' @rdname modify-dots
modify_dots <- function(...) {
  envir <- parent.frame()
  dots <- modifyList(.get_dots(envir), list(...))
  .dots_to_env(dots, envir)
}


.dots_to_env <- function(dots, envir) {
  stopifnot(is.list(dots))
  do.call(function(...) { # create new <...> object and assign it to caller env
    assign("...", environment()$..., envir = envir)
  }, dots)
}


#' Only keep args a function known in `...`
#'
#' Remove all args the function `fun ` does not know from the dots (`...`).
#'
#' @param fun Target function to make dots dafe for.
#' @example inst/examples/example-modify-dots.R
#' @export
#'
safe_dots <- function(fun) {
  fun <- match.fun(fun)
  envir <- parent.frame()
  dots <- .get_dots(envir)
  args_keep <- intersect(names(dots), names(formals(fun)))
  .dots_to_env(dots[args_keep], envir)
}
