test_that("Test suite aag.R; rcyc()", {

  checker <- function(x,n) {
      stopifnot(n > 1)
      n <- as.integer(n)
      expect_false(any(is.id(x)))
      expect_true(all(sapply(shape(x), function(x){identical(x, n)})))
      expect_true(all(as.function(x)(1) %in% seq(from=2, to=n)))
  }

  for (i in 1:5) {
      n <- sample(2:9,1)
      checker(rcyc(10,n),n)
  }
  
})
