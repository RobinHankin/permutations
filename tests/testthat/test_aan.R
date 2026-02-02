test_that("Test suite aan.R; sum()", {

    x <- c(as.cycle("(12)"), as.cycle("(78)"))
    y <- c(as.cycle("(345)"), as.cycle("(9,11)"))
    z <- as.cycle(c(6,7))
    
    expect_true(sum1(x) == x[1] + x[2])
    expect_true(sum1(x) == x[2] + x[1])

    expect_true(sum(x) == x[1] + x[2])
    expect_true(sum(x) == x[2] + x[1])
    expect_true(sum(y) == y[1] + y[2])
    expect_true(sum(y) == y[2] + y[1])

    expect_true(sum(x,y) == sum1(x) + sum1(y))
    expect_true(sum1(c(x,y)) == sum(x) + sum(y))

    expect_error(sum(x,z))    #x,z not disjoint
    expect_error(sum(c(x,z)))
    expect_error(sum1(c(x,z)))
    
    expect_error(sum(x,y,z))    #x,z not disjoint
    expect_error(sum(c(x,y,z)))
    expect_error(sum1(c(x,y,z)))
    


    a <- cyc_len(2:29) + cumsum(1:28)
    expect_true(sum(a) == sum1(a))

    expect_error(sum(a, a))
    expect_error(sum(a, as.cycle(c(3,400))))

})
