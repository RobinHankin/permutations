#' @importFrom magic shift
#' @importFrom numbers mLCM
#' @importFrom partitions as.partition perms listParts
#' @importFrom graphics plot polygon text
#' @importFrom utils data
#' @importFrom methods setGeneric

#' @importClassesFrom freealg dot
#' @importMethodsFrom freealg "["


#' @export
`Ops.permutation` <-
  function(e1, e2 = NULL) {
    if (nargs() == 1) { # unary operator
      if (.Generic == "+") {
        return(e1)
      } else if (.Generic == "-") {
        return(inverse(e1))
      } else {
        stop("unary operator '", .Generic, "' is not implemented for permutations")
      }
    }

    lclass <- nchar(.Method[1]) > 0
    rclass <- nchar(.Method[2]) > 0

    if (lclass && rclass) {
      if (.Generic == "*") {
        return(word_prod(e1, e2))
      } else if (.Generic == "^") {
        return(conjugation(e1, e2))
      } else if (.Generic == "/") {
        return(word_prod(e1, inverse(e2)))
      } else if (.Generic == "==") {
        return(word_equal(e1, e2))
      } else if (.Generic == "!=") {
        return(!word_equal(e1, e2))
      } else if (.Generic == "+") {
        return(cycle_sum(e1, e2))
      } else {
        stop(gettextf("<perm> %s <perm> not defined", .Generic))
      }
    } else if (lclass && !rclass) {
      if (.Generic == "^") {
        return(cycle_power(e1, e2)) # e2 should be an integer
      } else if (.Generic == "+") {
        return(cycle_plus_integer_elementwise(e1, e2))
      } else if (.Generic == "-") {
        return(cycle_plus_integer_elementwise(e1, -e2))
      } else {
        stop(gettextf("<perm> %s <non-perm> is not defined", .Generic))
      }
    } else if (!lclass && rclass) {
      if (.Generic == "+") {
        return(cycle_plus_integer_elementwise(e2, e1))
      } else if (.Generic == "^") { # 2^a
        return(as.function(e2)(e1))
      } else {
        stop(gettextf("<non-perm> %s <perm> is not defined ", .Generic))
      }
    } else if (!lclass && !rclass) {
      stop("should not reach here")
    } else {
      stop("this cannot happen")
    }
  }

#' @export
word_prod_single <- function(e1, e2) { # works for words (in vector form)
  stopifnot(length(e1) == length(e2))
  e1 <- as.vector(e1)
  e2 <- as.vector(e2)
  return(e2[e1]) # this is why we need arrays starting at 1, not 0
}

#' @export
helper <- function(e1, e2) { # sorts out recycling for binary
  # functions; also not that the rownames of
  # the returned matrix are used in things
  # like cycle_power()
  jj1 <- seq_along(e1)
  names(jj1) <- names(e1)
  jj2 <- seq_along(e2)
  names(jj2) <- names(e2)
  cbind(jj1, jj2)
}

#' @export
word_prod <- function(e1, e2) { # e1 and e2 are assumed to be word objects.

  e1 <- as.word(e1)
  e2 <- as.word(e2)

  n <- max(size(e1), size(e2))
  size(e1) <- n
  size(e2) <- n

  jj <- helper(e1, e2)
  e1 <- unclass(e1)
  e2 <- unclass(e2)

  out <- apply(jj, 1, function(ind) {
    word_prod_single(e1[ind[1], ], e2[ind[2], ])
  })
  out <- word(t(out))
  return(out)
}

#' @export
word_equal <- function(e1, e2) { # e1 and e2 are both coerced to 'word' objects
  jj <- helper(e1, e2)

  n <- max(size(e1), size(e2))

  e1 <- unclass(as.word(e1, n))
  e2 <- unclass(as.word(e2, n))

  out <- apply(jj, 1, function(ind) {
    all(e1[ind[1], ] == e2[ind[2], ])
  }) # comparing words
  return(out)
}

#' @export
cycle_sum_single <- function(c1, c2) { # takes two disjoint cycles and returns a cyclist.
  ## cycle_sum_single(as.cycle(1:9), as.cycle(100:103))

  ## NB cannot take more than two arguments because we need to check
  ## for pairwise disjointness!  (

  if (!any(unlist(c1, recursive = TRUE) %in% unlist(c2, recursive = TRUE))) {
    jj <- c(unlist(c1, recursive = FALSE), unlist(c2, recursive = FALSE))
    return(jj)
  } else {
    stop("cycles not disjoint")
  }
}

#' @export
cycle_sum <- function(e1, e2) { #
  jj <- helper(e1, e2)

  e1 <- as.cycle(e1)
  e2 <- as.cycle(e2)

  out <- apply(jj, 1, function(ind) {
    cycle_sum_single(e1[ind[1]], e2[ind[2]])
  })
  return(cycle(out))
}

#' @export
ccps <- function(n, pow) { # ccps == 'canonical_cycle_power_single'
  ## here 'n' is interpreted as as.cycle(seq_len(n)).  Thus
  ## ccps(9,3) == as.cycle(1:9)^3 == (147)(258)(369).

  ## here, "canonical" means a cycle of form (1,2,3,...,n) -- that
  ## is, seq_len(n) for some integer n.  Compare cycles such as
  ## (586), which are not canonical

  ## Note that ccps(n,n) == ccps(0,n) == ccps(n,0) == ()

  ## returns a vector in *word* format.

  ## Thus:
  ##        as.word(ccps(9,3))             appropriate
  ##        as.cycle(as.word(ccps(9,3)))   appropriate
  ##        as.cycle(ccps(9,3))          inappropriate


  ## x <- c(3,41,5,6,8,4)
  ## rbind(x,sigma=x[ccps(length(x),2)])   (gives the permutation in array form)

  pow <- pow %% n
  if (pow == 0) {
    return(seq_len(n)) # the identity, in word format
  } else {
    return(shift(seq_len(n), -pow))
  }
}

#' @export
vps <- function(vec, pow) { # 'vps' == Vector Power Single, vector_power_single()

  ## 'vec' is an integer vector, interpreted as a cycle. Function
  ## vector_power_single() raises vec to the n-th power, and returns a
  ## *cyclist*.

  ## use-case: vps(c(3,41,5,6),2) == (3,5)(41,6); the R idiom for


  ## Thus:

  ## cycle(vps(sample(100),55))           --   acceptable
  ## as.cycle(vps(sample(100),55))        -- unacceptable
  ## cycle(list(vps(sample(1:100,12),8))) --   acceptable


  n <- length(vec)

  if ((pow == 0) | n == 0) {
    out <- list(c())
  } else if (pow == 1) {
    out <- list(vec)
  } else {
    out <- lapply(vec2cyclist_single(ccps(n, pow)), function(o) {
      vec[o]
    })
  }
  return(out)
}

#' @export
cycle_power_single <- function(x, pow) {
  stopifnot(is.cycle(x) & length(x) == 1)
  out <- unlist(x, recursive = FALSE)
  out <- lapply(out, vps, pow = pow)
  out <- unlist(out, recursive = FALSE)
  return(cycle(list(out)))
}

#' @export
cycle_power <- function(x, pow) { # cf cycle_sum(); here 'pow' is a
  # vector of integers.

  e1 <- as.cycle(x)
  e2 <- pow
  jj <- helper(e1, e2)
  out <- apply(jj, 1, function(ind) {
    cycle_power_single(e1[ind[1]], e2[ind[2]])
  })
  return(cycle(unlist(out, recursive = FALSE)))
}

#' @export
conjugation <- function(e1, e2) { # e1 and e2 are both coerced to 'word' objects
  n <- max(size(e1), size(e2))
  e1 <- as.word(e1)
  e2 <- as.word(e2)
  size(e1) <- n
  size(e2) <- n
  jj <- helper(as.word(e1), as.word(e2))
  f <- function(ind) {
    as.vector(inverse(e2[ind[2]]) * e1[ind[1]] * e2[ind[2]])
  }
  out <- apply(jj, 1, f)
  return(word(t(out)))
}

#' @export
cycle_plus_integer_elementwise <- function(x, y) {
  jj <- cbind(seq_along(x), seq_along(y))
  n <- nrow(jj)
  out <- rep(id, n)
  for (i in seq_len(n)) {
    out[i] <- capply(x[jj[i, 1]], function(x) {
      x + y[jj[i, 2]]
    })
  }
  return(out)
}

#' @export
sum1 <- function(x){
    x <- as.cycle(x)
    x <- x[!is.id(x)]
    as.cycle(lapply(seq_along(x), function(i){unlist(x[i][[1]])}))
}

#' @export
sum.permutation <- function(..., na.rm=FALSE){
    jj <- list(...)
    out <- id
    for(i in seq_along(jj)){
        out <- out + sum1(jj[i][[1]])
    }
    return(out)
}
