test_that("Test suite aao.R; swap()", {

    expect_true(swap(4,7) == as.cycle("(47)"))
    expect_true(swap(8,5) + swap(2,6) == as.cycle("(26)(85)"))
        
    n <- 20
    x <- sample(9, n, replace=TRUE)
    y <- sample(9, n, replace=TRUE)
    
    for(i in seq_len(n)){
        expect_true(is.id(swap(x[i], y[i]) * swap(x[i],y[i])))
    }
    
    for(i in seq_len(n)){
        jj <- sample(9, 8, replace=FALSE)
        expect_false(is.id(
            swap(jj[1], jj[2]) + 
            swap(jj[3], jj[4]) + 
            swap(jj[5], jj[6]) + 
            swap(jj[7], jj[8])
        ))
    }
    
})
