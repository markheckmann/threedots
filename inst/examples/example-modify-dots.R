library(threedots)

# toy example
foo <- \(...) {
  cat("-- START --------\n")
  print(list(...))

  cat("-- CHANGE 1: update 'a', add 'b' -------\n")
  modify_dots(a = 999, b = 2) # set a and b
  print(list(...))

  cat("-- CHANGE 2: increment 'a', remove 'b' -------\n")
  modify_dots(a = .(a) + 1, b = NULL) # set a, using a's current value, remove b
  print(list(...))
}

foo(a = 1)
