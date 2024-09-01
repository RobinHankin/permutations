test_that("Test suite aal.R; all_perms_shape()", {

    f <- function(o){expect_true(all(unlist(lapply(shape(all_perms_shape(o)),function(x){all(sort(x) == sort(o[o>1]))}))))}

    f(c(1,2))
    f(c(2,2))
    f(c(2,3))


    expect_true(length(allpermslike(as.cycle("(12)(3456)"))) == 6)

    
  
})
