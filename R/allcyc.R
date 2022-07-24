`allcyc` <- function(n){
    out <- matrix(0,factorial(n-1),n)
    index <- 1
    CyclicPermut2 <- function(i,p){
        j <- i+1
        x <- p[i]
        if(i<n){ # 'n' available via lexical scope
            while(j <= n){  
                p[i] <- p[j]
                p[j] <- x
                CyclicPermut2(i+1,p) # recursive
                p[j] <- p[i]
                j <- j+1
            } # while loop closes
          p[i] <- x
        } else { 
            out[index,] <<- p
            index <<- index+1
        }
    } # definition of CyclicPermut() closes
    CyclicPermut2(1,seq_len(n))
    return(as.word(out))
}

`r1cyc` <- function(r){
    out <- sample(seq_len(r))
    for(i in seq_len(r-1)){
        j <- sample(seq(from=i+1,to=r),1)
        swap <- out[i]
        out[i] <- out[j]
        out[j] <- swap
    }
    return(out)
}
 
`rcyc` <- function(n,r){
    out <- matrix(0,n,r)
    for(i in seq_len(n)){
        out[i,] <- as.word(as.cycle(r1cyc(r)))
    }
    return(as.cycle(out))
}   
