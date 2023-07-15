
library("partitions")
library("permutations")

`allpermslike` <- function(o){ #   allpermslike(as.cycle("(1,2)(3,4)(5,6,7,8)"))
  x <- lapply(unclass(o)[[1]],FUN = allcyc)
  xlen <- unlist(lapply(x,length))
  xseq <- sapply(xlen,seq_len,simplify=FALSE)
  e <- as.matrix(expand.grid(xseq))
  out <- nullcycle
  for(i in seq_len(nrow(e))){
    jj <- id
    for(j in seq_len(ncol(e))){
      jj <- jj + x[[j]][e[i,j]]
    }
    out <- c(out,jj)
  }
  return(out)
}

`some_perms_shape` <- function(part){  # some_perms_shape(c(2,2,4))
  M <- listParts(part)
  do.call("c",lapply(seq_along(M),function(i){as.cycle(unclass(M[[i]]))}))
}

`all_cyclic_shuffles` <- function(u){  # all_cyclic_shuffles(cyc_len(3:5))
  u <- as.cycle(u)
  do.call("c",lapply(seq_along(u),function(i){allpermslike(u[i])}))
}

all_perms_shape <- function(p){all_cyclic_shuffles(some_perms_shape(p))} # all_perms_shape(c(2,2,3))

