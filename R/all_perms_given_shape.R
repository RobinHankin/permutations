#' @export
`allpermslike` <- function(o) { #   allpermslike(as.cycle("(1,2)(3,4)(5,6,7,8)"))
  x <- lapply(unclass(as.cycle(o))[[1]], FUN = allcyc)
  xlen <- unlist(lapply(x, length))
  xseq <- sapply(xlen, seq_len, simplify = FALSE)
  e <- as.matrix(expand.grid(xseq))
  out <- nullcycle
  for (i in seq_len(nrow(e))) {
    jj <- id
    for (j in seq_len(ncol(e))) {
      jj <- jj + x[[j]][e[i, j]]
    }
    out <- c(out, jj)
  }
  return(out)
}

#' @export
`some_perms_shape` <- function(shape) { # some_perms_shape(c(2,2,4))
  M <- listParts(shape)
  do.call("c", lapply(seq_along(M), function(i) {
    as.cycle(unclass(M[[i]]))
  }))
}

#' @export
`all_cyclic_shuffles` <- function(o) { # all_cyclic_shuffles(cyc_len(3:5))
  o <- as.cycle(o)
  do.call("c", lapply(seq_along(o), function(i) {
    allpermslike(o[i])
  }))
}

#' @export
`all_perms_shape` <- function(shape) { # all_perms_shape(c(2,2,3))
  all_cyclic_shuffles(some_perms_shape(shape))
}
