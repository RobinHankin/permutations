singleword_valid <- function(w) { # takes an integer vector
  if (length(w) == 0) {
    return(TRUE)
  }
  if (identical(unname(seq_len(max(w))), unname(sort(w)))) {
    return(TRUE)
  } else {
    warning("invalid word")
    return(FALSE)
  }
}

cyclist_valid <- function(x) { # takes a cyclist and checks it for validity
  if (length(unlist(x)) == 0) {
    return(TRUE)
  }
  x <- c(x, recursive = TRUE)
  if (any(x < 0)) {
    warning("negative elements")
    return(FALSE)
  } else if (any(x == 0)) {
    warning("zero element")
    return(FALSE)
  } else if (any(abs(x - round(x)) > 0.1)) {
    warning("non-integer entries")
    return(FALSE)
  } else if (any(table(x) > 1)) {
    warning("repeated value")
    return(FALSE)
  } else {
    return(TRUE)
  }
}
