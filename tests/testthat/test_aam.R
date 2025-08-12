test_that("Test suite aam.R; faro()", {

    ## Following verifies A002326 of OEIS:
    
    A002326_oeis <-
        c(1, 2, 4, 3, 6, 10, 12, 4, 8, 18, 6, 11, 20,
          18, 28, 5, 10, 12, 36, 12, 20, 14, 12, 23, 21,
          8, 52, 20, 18, 58, 60, 6, 12, 66, 22, 35, 9,
          20, 30, 39, 54, 82, 8, 28, 11, 12, 10, 36, 48,
          30, 100, 51, 12, 106, 36, 36, 28, 44, 12, 24,
          110, 20, 100, 7, 14, 130, 18, 36, 68, 138, 46,
          60, 28)

    A002325_permutations <- sapply(0:72, function(n){permorder(faro(n))})

    expect_true(all(A002326_oeis == A002325_permutations))

  
})
