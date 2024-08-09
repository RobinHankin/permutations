"word" <- function(M) {
  stopifnot(is.matrix(M))
  storage.mode(M) <- "integer"
  if (nrow(M) > 0) {
    stopifnot(all(apply(M, 1, singleword_valid)))
  }
  class(M) <- c("permutation", "word") # NB this is the
  # *only* place that
  # class "word" is
  # assigned to an
  # object
  return(M)
}

"cycle" <- function(x) {
  jj <- unlist(lapply(x, cyclist_valid))

  if (all(sapply(jj, isTRUE))) {
    x <- lapply(x, nicify_cyclist)
    class(x) <- c("permutation", "cycle") # NB this is the
    # *only* place that
    # class "cycle" is
    # assigned to an
    # object
    return(x)
  } else {
    stop(jj)
  }
}

`permutation` <- function(x) {
  if (is.matrix(x)) {
    return(word(x))
  } else if (is.character(x)) {
    return(char2cycle(x))
  } else if (is.list(x)) {
    return(cycle(x))
  } else {
    stop("not recognised")
  }
}

is.id <- function(x) {
  UseMethod("is.id", x)
}

is.id_single_cycle <- function(x) {
  is.null(unlist(x))
}

is.id.cycle <- function(x) {
  unlist(lapply(x, is.id_single_cycle))
}
is.id.word <- function(x) {
  if (length(x) == 0) {
    return(logical(0))
  }
  if (size(x) == 0) {
    return(rep(TRUE, length(x)))
  }
  jj <- as.matrix(x)
  apply(jj == col(jj), 1, all)
}

is.id.list <- function(x) {
  length(unlist(x)) == 0
} # use for cyclists.

is.word <- function(x) {
  inherits(x, "word")
}

is.cycle <- function(x) {
  inherits(x, "cycle")
}

is.permutation <- function(x) {
  inherits(x, "permutation")
}

as.matrix.word <- function(x, ...) {
  unclass(x)
}

names.word <- function(x) {
  rownames(x)
}

"names<-.word" <- function(x, value) {
  rownames(x) <- value
  return(x)
}

"[.word" <- function(x, ...) {
  x <- unclass(x)
  word(x[..., , drop = FALSE])
}

"[<-.word" <- function(x, index, value) {
  out <- t(as.matrix(x))
  value <- t(as.matrix(as.word(value, size(x))))
  out[, index] <- value
  return(word(t(out)))
}

"[.cycle" <- function(x, ...) {
  x <- unclass(x)
  cycle(x[...])
}

"c.word" <- function(...) {
  a <- list(...)
  if (!all(unlist(lapply(a, is.word)))) {
    stop("all arguments must be the same class")
  } else {
    n <- max(unlist(lapply(a, size)))
    a <- lapply(a, "size<-", n)
    word(do.call("rbind", a))
  }
}

"c.cycle" <- function(...) {
  if (!all(unlist(lapply(list(...), is.cycle)))) {
    stop("all arguments must be the same class")
  } else {
    return(cycle(unlist(list(...), recursive = FALSE)))
  }
}

addcols <- function(M, n) {
  if (nrow(M) == 0) {
    return(matrix(integer(0), 0, n))
  }
  nm <- ncol(M)
  if (n >= nm) {
    return(cbind(M, matrix(seq(from = 1 + nm, len = n - nm), nrow(M), n - nm, byrow = TRUE)))
  } else {
    stop("cannot remove columns")
  }
}

as.word <- function(x, n = NULL) {
  if (is.word(x)) {
    if (missing(n)) {
      return(x)
    } else {
      size(x) <- n
      return(x)
    }
  } else if (is.cycle(x)) {
    return(cycle2word(x, n))
  } else if (!is.numeric(x)) {
    stop("can only coerce numeric objects to word")
  } else if (is.matrix(x)) {
    if (missing(n)) {
      n <- ncol(x)
    }
    return(word(addcols(x, n)))
  } else if (is.vector(x)) {
    if (missing(n)) {
      n <- length(x)
    }
    return(word(addcols(t(x), n)))
  } else {
    warning("cannot coerce to class word")
    return(NA)
  }
}

`print.word` <- function(x, h = getOption("print_word_as_cycle"), ...) {
  if (!identical(h, FALSE)) {
    print(as.cycle(x))
    cat("[coerced from word form]\n")
    return(x)
  } else {
      print_word(x)
      return(invisible(x))
  }
}

`print_word` <- function(x) {
  x <- as.word(x)
  ## contortions needed because x might have zero columns
  given <- x
  x <- unclass(x)
  ps <- getOption("perm_set")
  if (is.null(rownames(x)) & length(x) > 0) {
    rownames(x) <- paste("[", seq_len(nrow(x)), "]", sep = "")
  }
  if (ncol(x) > 0) {
    if (is.null(ps)) {
      colnames(x) <- paste(seq_len(ncol(x)), sep = "")
    } else {
      colnames(x) <- paste(ps[seq_len(ncol(x))], sep = "")
    }
  } else {
    cat(" {}")
  }
  jj <- x
  dots <- x == col(x)
  jj[dots] <- "."
  if (!is.null(ps)) {
    jj[!dots] <- ps[x[!dots]]
  }
  print(noquote(jj))
  return(invisible(given))
}

as.cycle <- function(x) {
  if (missing(x)) {
    return(id)
  } else if (is.cycle(x)) {
    return(x)
  } else if (is.character(x)) {
    return(char2cycle(x))
  } else if (is.vector(x, mode = "numeric")) {
    return(cycle(list(list(x))))
  } else if (is.list(x) & all(unlist(lapply(x, is.vector)))) { # a cyclist
    return(cycle(list(x)))
  } else if (is.matrix(x)) { # includes words
    if (nrow(x) == 0) {
      return(nullcycle)
    }
    out <- apply(word(x), 1, vec2cyclist_single)
    names(out) <- rownames(x)
    return(cycle(out))
  } else {
    stop("not recognised")
  }
}

`cyc_len` <- function(n) {
  cycle(sapply(n, function(n) {
    list(list(seq_len(n)))
  }))
}
shift_cycle <- cyc_len

char2cyclist_single <- function(x) {
  if (all(unlist(strsplit(x, "")) != ",")) { # no commas anywhere
    commas <- ""
  } else {
    commas <- ","
  }

  jj <- lapply(
    strsplit(
      gsub(
        "\\(", "",
        unlist(strsplit(gsub(" ", "", x), ")"))
      ), commas
    ), as.numeric
  )

  return(jj)
}

char2cycle <- function(char) {
  out <- cycle(sapply(char, char2cyclist_single, simplify = FALSE))
  if (is.null(names(char))) {
    names(out) <- NULL
  }
  return(out)
}

cycle2word <- function(x, n = NULL) { # cycle2word(as.cycle(1:5))
  if (is.null(n)) {
    if (all(is.id(x))) {
      n <- 0
    } else {
      n <- max(unlist(x, recursive = TRUE))
    }
  }
  word(do.call("rbind", lapply(x, cyclist2word_single, n = n)))
}

cyclist2word_single <- function(cyc, n) {
  if (length(unlist(cyc)) == 0) {
    return(seq_len(n))
  } # checking for the identity
  maxn <- max(unlist(cyc, recursive = TRUE))

  if (missing(n)) {
    n <- maxn
  } else {
    if (n < maxn) {
      stop("supplied value of 'n' is too small")
    }
  }

  out <- seq_len(n)
  for (i in seq_along(cyc)) {
    out[cyc[[i]]] <- shift(out[cyc[[i]]], -1)
  }
  return(out)
}

print.cycle <- function(x, give_string = FALSE, ...) { # x is a cycle.  Use case: print(cycle(list(x,y,z)))

  if ((length(unlist(x)) > 0)) {
    uc <- getOption("comma")
    if (isTRUE(uc)) {
      comma <- TRUE
    } else if (isFALSE(uc)) {
      comma <- FALSE
    } else { # default; prototypically uc=NULL
      comma <- max(unlist(x, recursive = TRUE)) > 9
    }
  }
  out <- unlist(lapply(x, as.character_cyclist, comma = comma))
  if (is.null(out)) {
    if (give_string) {
      return("cycle(0)")
    } else {
      cat("cycle(0)\n")
      return(out)
    }
  } else {
    if (give_string) {
      return(out)
    } else {
      print(noquote(out))
      return(invisible(x))
    }
  }
}

print_cycle <- function(x) {
  print.cycle(as.cycle(x))
}

as.character_cyclist <- function(y, comma = TRUE) {
  if (length(y) == 0) {
    return("()")
  }
  ps <- getOption("perm_set")
  if (!is.null(ps)) {
    y <- lapply(y, function(x) {
      ps[x]
    })
  }
  if (comma) {
    s <- ","
  } else {
    s <- ""
  }
  if (isTRUE(getOption("print_in_length_order"))) {
    y <- y[order(unlist(lapply(y, length)))]
  }
  paste(sapply(y, function(u) {
    paste(paste("(", paste(u, collapse = s), sep = ""), ")", sep = "")
  }), collapse = "")
}

as.character.cycle <- function(x, ...) {
  stopifnot(is.cycle(x))
  unlist(lapply(x, function(x) {
    as.character_cyclist(x)
  }))
}

standard_cyclist <- function(x, n = NULL) {
  xvec <- unlist(x, recursive = TRUE)
  if (is.null(n)) {
    n <- max(xvec)
  }
  jj <- seq_len(n)
  nicify_cyclist(c(x, as.list(jj[!(jj %in% xvec)])), rm1 = FALSE, smallest_first = FALSE)
}

standard <- function(cyc, n = NULL) {
  cyc <- as.cycle(cyc)
  xvec <- unlist(cyc, recursive = TRUE)
  if (is.null(n)) {
    n <- max(xvec)
  }

  lapply(cyc, standard_cyclist, n = n)
}

fbin_single <- function(vec) { # takes a vector: fbin_single(sample(9))
  cycle(list(split(vec, cumsum(vec == cummax(vec)))))
}

fbin <- function(W) { # use-case: fbin(rperm(30,9))
  W <- as.matrix(as.word(W))
  cycle(unlist(apply(W, 1, fbin_single), recursive = FALSE))
}

fbin_inv <- function(cyc) { # use-case: fbin_inv(as.cycle(rperm(30,9)))
  cyc <- as.cycle(cyc)
  f <- function(x) {
    c(x, recursive = TRUE)
  }
  word(do.call("rbind", lapply(standard(cyc), f)))
}

nicify_cyclist <- function(x, rm1 = TRUE, smallest_first = TRUE) { # needs rm1 argument for  standard_cyclist()

  if (isTRUE(rm1)) { # remove singletons
    x <- remove_length_one(x)
  }
  if (smallest_first) {
    f <- which.min
  } else {
    f <- which.max
  }

  out <- lapply(x, function(o) {
    shift(o, 1 - f(o))
  })
  order_wanted <- order(sapply(out, function(o) {
    o[1]
  }))
  out <-
    do.call("list", sapply(order_wanted, function(i) {
      out[[i]]
    }, simplify = FALSE)) # sort it by first [that is, the largest] element
  return(out)
}

remove_length_one <- function(x) {
  x[unlist(lapply(x, function(u) {
    length(u) > 1
  }))]
}

vec2cyclist_single_cpp <- function(p) {
  stop("vec2cyclist_single_cpp() not written yet")
}

vec2cyclist_single <- function(p) {
  n <- length(p) # NB min(p) = 1 (not 0, off-by-one)
  out <- list()
  not_done <- rep(TRUE, length(p))
  while (any(not_done)) {
    f <- min(which(not_done)) # first in bracket
    neew <- u <- f
    not_done[neew] <- FALSE
    while (u != (neew <- p[neew])) {
      not_done[neew] <- FALSE
      f <- c(f, neew)
    }
    if (length(f) > 1) {
      out <- c(out, list(f))
    }
  }
  out # NB a list whose elements are vectors which represent the cycles
}

inverse <- function(x) {
  UseMethod("inverse", x)
}

inverse_word_single <- function(W) {
  W[W] <- seq_along(W)
  return(W)
}

inverse_cyclist_single <- function(cyc) { # takes a cyclist, returns a cyclist
  ## use case:  inverse_cyclist_single(list(c(4, 6), c(2, 5, 1), c(8, 3)))

  lapply(cyc, function(o) {
    c(o[1], rev(o[-1]))
  })
}

inverse.word <- function(x) { # takes a word, returns a word.  inverse.word(rperm(8,5))
  x <- as.word(x)
  word(t(apply(x, 1, inverse_word_single)))
}

inverse.cycle <- function(x) {
  cycle(lapply(x, inverse_cyclist_single))
}

rperm <- function(n = 10, r = 7, moved = NA) {
  if (is.na(moved)) {
    return(word(matrix(replicate(n, sample(seq_len(r))), n, r, byrow = TRUE)))
  } else {
    f <- function(moved) {
      out <- seq_len(r)
      jj <- sample(r, moved)
      out[jj] <- sample(jj)
      return(out)
    }
    return(as.word(matrix(replicate(n, f(moved)), n, r, byrow = TRUE)))
  }
}

"shape" <- function(x, drop = TRUE, id1 = TRUE, decreasing = FALSE) {
  x <- as.cycle(x)
  out <- lapply(x, shape_cyclist, id1 = id1)
  if (drop & (length(x) == 1)) {
    out <- unlist(out)
  }
  if (decreasing) {
    out <- lapply(out, sort, decreasing = TRUE)
  }
  return(out)
}

padshape <- function(x, drop = TRUE, n = NULL) {
  if (is.null(n)) {
    n <- max(x)
  }
  f <- function(s) {
    sort(c(s, rep(1L, n - sum(s))), decreasing = TRUE)
  }
  out <- lapply(shape(x, drop = FALSE), f)
  if (drop & (length(x) == 1)) {
    out <- unlist(out)
  }
  return(out)
}


shape_cyclist <- function(cyc, id1 = TRUE) { # use case: shape_cyclist(list(1:4,8:9))
  out <- unlist(lapply(cyc, length))
  if (id1 & is.null(out)) {
    return(1)
  } else {
    return(out)
  }
}

shapepart_cyclist <- function(cyc, n = NULL) {
  if (length(cyc) > 0) {
    nmax <- max(unlist(cyc, recursive = TRUE))
  } else {
    nmax <- n
  }
  if (is.null(n)) {
    n <- nmax
  }
  if (n < nmax) {
    stop("value of n too small")
  }
  out <- rep(0, n)
  for (i in seq_along(cyc)) {
    out[cyc[[i]]] <- i
  }
  out[out == 0] <- seq(from = max(out) + 1, len = sum(out == 0))
  return(out)
}

shapepart <- function(x) {
  x <- as.cycle(x)
  out <- do.call("cbind", lapply(x, shapepart_cyclist, n = size(x)))
  colnames(out) <- names(x)
  as.partition(out)
}

size <- function(x) {
  UseMethod("size", x)
}

size.word <- function(x) { # size(word(
  ncol(as.matrix(x))
}

size.cycle <- function(x) {
  if (all(is.id(x))) {
    return(0)
  }
  max(unlist(x, recursive = TRUE))
}

"size<-" <- function(x, value) {
  UseMethod("size<-")
}

"size<-.word" <- function(x, value) {
  stopifnot(is.word(x))
  return(word(addcols(trim(x), value)))
}

"size<-.cycle" <- function(x, value) {
  stop("cannot alter the size of a cycle")
}

"length<-.permutation" <- function(x, value) {
  stop("cannot change the length of a permutation")
}

length.word <- function(x) {
  nrow(x)
}

trim <- function(x) {
  ##    stop("problems: trim(as.word(1:6)) should return the empty word, but doesn't")
  stopifnot(is.word(x))
  if (length(x) == 0) {
    return(nullword)
  }
  if (all(is.id(x))) {
    return(x)
  }
  y <- as.matrix(as.word(x))
  n <- ncol(y)
  jj <- apply(y, 2, max)
  fix <- (jj == apply(y, 2, min)) & (jj == seq_len(n))
  if (fix[n]) {
    lose <- sum(cumprod(as.numeric(rev(fix))) > 0)
    return(word(y[, seq_len(n - lose), drop = FALSE]))
  } else {
    return(x)
  }
}

fixed <- function(x) {
  UseMethod("fixed", x)
}

fixed.word <- function(x) { # fixed(word(t(c(2,3,5,4,1))))
  x <- as.matrix(x)
  if (nrow(x) > 0) {
    return(apply(x == col(x), 2, all))
  } else {
    return(logical(0))
  }
}

fixed.cycle <- function(x) { # fixed(as.cycle(1:3) + as.cycle(10:11))
  n <- size(x)
  jj <- unlist(x, recursive = TRUE)
  !(seq_len(n) %in% jj)
}

"tidy" <- function(x) {
  x <- as.word(x)
  x <- as.matrix(x)[, !fixed(x), drop = FALSE]
  if (nrow(x) == 0) {
    return(nullword)
  }
  n <- seq_len(ncol(x))
  u <- unique(sort(x))
  ind <- 0 * n
  ind[u] <- n
  x[] <- ind[x]
  word(x)
}

rep.permutation <- function(x, ...) {
  u <- seq(length.out = length(x))
  return(x[rep(u, ...)])
}

sgn <- function(x) {
  .f <- function(o) {
    ifelse(is.null(o), 1, 1 - 2 * sum(o - 1) %% 2)
  }
  if (length(x) == 1) {
    return(.f(shape(x)))
  } else {
    return(unlist(lapply(shape(as.cycle(x)), .f)))
  }
}

is.even <- function(x) {
  sgn(x) == 1
}
is.odd <- function(x) {
  sgn(x) == -1
}

are_conjugate_single <- function(a, b) { # difficulties arise with the identity.
  stopifnot((length(a) == 1) & (length(b) == 1))
  if (is.id(a) & is.id(b)) {
    return(TRUE)
  } else if (xor(is.id(a), is.id(b))) {
    return(FALSE)
  } else {
    return(identical(unname(sort(shape(a))), unname(sort(shape(b)))))
  }
}

are_conjugate <- function(x, y) {
  jj <- helper(x, y)
  apply(jj, 1, function(ind) {
    are_conjugate_single(x[ind[1]], y[ind[2]])
  })
}



"%~%" <- function(x, y) {
  UseMethod("%~%")
}
"%~%.permutation" <- function(x, y) {
  are_conjugate(x, y)
}


as.function.permutation <- function(x, ...) {
  a <- NULL # to suppress the warning about 'no visible binding for global variable 'a'
  x <- as.matrix(as.word(x))
  as.function(alist(a = , x[, a]))
}

commutator <- function(x, y) {
  n <- max(size(x), size(y))
  jj <- helper(x, y)
  e1 <- as.matrix(as.word(x, n))
  e2 <- as.matrix(as.word(y, n))

  ##    f <- function(ind){commutator_single(e1[ind[1]],e2[ind[2]],n=n)}

  f <- function(ind) {
    j1 <- e1[ind[1], ]
    j2 <- e2[ind[2], ]
    word_prod_single(
      word_prod_single(
        word_prod_single(
          inverse_word_single(j1),
          inverse_word_single(j2)
        ), j1
      ), j2
    )
  }

  return(as.word(t(apply(jj, 1, f))))
}

permorder <- function(x, singly = TRUE) {
  jj <- shape(x, id1 = TRUE, drop = FALSE)
  f <- function(n) {
    mLCM(c(1, n))
  } # needed because mLCM(5) fails
  if (singly) {
    return(unlist(lapply(jj, f)))
  } else {
    return(f(as.vector(unlist(jj)))) # as.vector() needed to return an unnamed integer
  }
}

is.derangement <- function(x) {
  x <- as.word(x)
  n <- seq_len(size(x))
  if (size(x) == 0) { # identity element is not a derangment
    out <- rep(FALSE, length(x))
    names(out) <- names(x)
    return(out)
  }
  apply(as.matrix(x), 1, function(u) {
    all(u != n)
  })
}

permprod <- function(x) {
  out <- id
  x <- as.word(x)
  for (i in seq_along(x)) {
    out <- out * x[i]
  }
  return(out)
}

"get1" <- function(x, drop = TRUE) {
  out <- lapply(as.cycle(x), function(u) {
    unlist(lapply(u, min))
  })
  if (drop & (length(x) == 1)) {
    out <- out[[1]]
  }
  return(out)
}

"get_cyc" <- function(x, elt) {
  f <- function(u) {
    u[unlist(lapply(u, function(v) {
      elt %in% v
    }))]
  }
  cycle(lapply(as.cycle(x), f))
}

"orbit_single" <- function(c1, n1) { # c1 is a cyclist, n1 an integer vector
  if (length(c1) == 0) {
    return(n1)
  }
  unlist(c1[which(unlist(lapply(c1, function(x) {
    n1 %in% x
  })))])
}

"orbit" <- function(cyc, n) {
  cyc <- as.cycle(cyc)
  jj <- helper(cyc, n)
  out <- apply(jj, 1, function(ind) {
    orbit_single(unlist(unclass(cyc[ind[1]]), recursive = FALSE), n[ind[2]])
  }, simplify = FALSE)
  nullout <- which(unlist(lapply(out, is.null)))
  out[nullout] <- n[jj[nullout, 2]]
  return(out)
}

"allperms" <- function(n) {
  word(t(perms(n)))
}

`cayley` <- function(x) {
  x <- as.cycle(x)
  if (is.null(names(x))) {
    sink(ifelse(.Platform$OS.type == "windows", "NUL:", "/dev/null"))
    names(x) <- print(x)
    sink()
  }


  f <- Vectorize(function(i, j) {
    jj <- x == x[i] * x[j]
    if (sum(jj) == 1) {
      return(names(x)[jj])
    } else {
      return(NA)
    }
  })

  out <- noquote(outer(seq_along(x), seq_along(x), f))
  rownames(out) <- names(x)
  colnames(out) <- names(x)
  return(out)
}

`perm_matrix` <- function(p, s = size(p)) {
  p <- as.word(p, s)
  stopifnot(length(p) == 1)
  M <- diag(rep(1L, s))[p, ] # the meat
  jj <- getOption("perm_set")
  if (is.null(jj)) {
    rownames(M) <- formatC(seq_len(s), width = ceiling(log10(s + 0.1)), format = "d", flag = "0")
  } else {
    rownames(M) <- jj[seq_len(s)]
  }
  colnames(M) <- rownames(M)
  return(M)
}

`is.perm_matrix` <- function(M) {
  if (
    is.matrix(M) &&
      nrow(M) == ncol(M) &&
      all(M %in% c(0L, 1L)) &&
      all(rowSums(M) == 1) &&
      all(colSums(M) == 1)) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

`pm_to_perm` <- function(M) {
  if (is.perm_matrix(M)) {
    return(as.word(as.vector(which(t(M) > 0, arr.ind = TRUE)[, 1, drop = TRUE])))
  } else {
    stop("'M' not a permutation matrix")
  }
}

setOldClass("permutation")
setMethod("[", signature(x = "dot", i = "permutation", j = "permutation"), function(x, i, j, drop) {
  commutator(i, j)
})

`capply` <- function(X, fun, ...) {
  cycle(lapply(as.cycle(X), function(x) {
    lapply(x, fun, ...)
  }))
}

setGeneric("outer")
setMethod(
  "outer", signature(X = "permutation", Y = "permutation"),
  function(X, Y, FUN = "*") {
    out <- matrix(apply(expand.grid(seq_along(X), seq_along(Y)), 1,
      function(v) {
        match.fun(FUN)(X[v[1]], Y[v[2]])
      },
      simplify = FALSE
    ), length(X), length(Y))
    rownames(out) <- names(X)
    colnames(out) <- names(Y)
    return(out)
  }
)
