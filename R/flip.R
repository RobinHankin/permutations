#' @export
is.flip_pair <- function(pair){
    if(length(pair) != 2){return(FALSE)}
    any(apply(permutations::edge_facets,1,function(x){all(sort(x) == pair)}))
}

#' @export
is.flip <- function(p){
    p <- as.cycle(p)
    out <- rep(FALSE,length(p))
    for(i in seq_along(p)){
        out[i] <- (
            all(shape(p[i]) == 2) &&
            all(sapply(unclass(p[i])[[1]], is.flip_pair, simplify = TRUE))
        )
    }
    return(out)
}

#' @export
is.superflip <- function(p){is.flip(p) & (sapply(shape(p), length) == 30) }
