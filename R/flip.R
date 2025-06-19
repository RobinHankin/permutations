is.flip_pair <- function(pair){
    if(length(pair) != 2){return(FALSE)}
    any(apply(edge_facets,1,function(x){all(sort(x) == pair)}))
}

stopifnot(all(
 is.flip_pair(c(10,46)),
 is.flip_pair(c(98,124)),
!is.flip_pair(c(10,98)),
!is.flip_pair(c(11,98))
))

is.flip_singleperm <- function(p){
    stopifnot(length(p) == 1)
    p <- as.cycle(p)
    if(any(shape(p) != 2)){return(FALSE)}
    all(sapply(unclass(p)[[1]], is.flip_pair, simplify = TRUE))
}

is.flip <- function(p){
    out <- rep(FALSE,length(p))
    for(i in seq_along(p)){
        out[i] <- is.flip_singleperm(p[i])
    }
    return(out)
}
