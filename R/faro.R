`faro` <- function(n,out=TRUE){
  if(out){
    return(faro_gen(n,2,p2=cyc_len(2)))
  } else {
    return(faro_gen(n,2))
  }
}

`faro_gen` <- function(n,m,p1=id,p2=id,interleave=TRUE){# generalized Faro shuffle
  M <- matrix(seq_len(n*m),n,m)
  p1 <- as.word(p1)
  p2 <- as.word(p2)
  size(p1) <- n
  size(p2) <- m
  M <- M[as.function(p1)(seq_len(n)),as.function(p2)(seq_len(m))]
  if(interleave){M <- t(M)}
  as.word(c(M))
}

