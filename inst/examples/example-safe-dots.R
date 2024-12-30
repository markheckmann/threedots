library(threedots)

fun <- \(a = 1, b = 2) {
  list(a = a, b = b)
}

foo <- \(...) {
  safe_dots(fun) # make dots safe to use with `fun`
  fun(...)
}

foo(a = 100, unknown_arg = -999, xxx = NA)
