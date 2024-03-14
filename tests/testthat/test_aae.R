test_that("Test suite aae.R; orbit()",{

    a1 <- orbit(as.cycle(c("(123)","(23)","(1234567)","(234567)","(13)(45)(67)(89)")),1)
    a2 <- list(c(1,2,3),1,c(1,2,3,4,5,6,7),1,c(1,3))
    expect_true(identical(a1,a2))

    expect_true(all(sapply(1:9,function(i){i %in% orbit(as.cycle("(45)(126)"),1:9)[[i]]})))
    expect_true(all(sapply(1:9,function(i){i %in% orbit(as.cycle("(45)"),1:9)[[i]]})))
                
    checker1 <- function(a,n){
            expect_true(all(unlist(lapply(orbit(a,n),function(x){n %in% x}))))
    }

    for(i in 1:2){
        for(n in 1:9){
            checker1(rperm(),n)
        }
    }
} )
