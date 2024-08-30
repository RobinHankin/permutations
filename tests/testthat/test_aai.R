test_that("Test suite aai.R; allpermslike()", {

  `checker` <- function(x,s) {

      expect_false(any(is.id(x)))
      expect_true(all(sapply(shape(x, drop = FALSE),function(x){all(sort(x) == sort(s))})))
  }

  for (i in 1:5) {
      s <- 2:4
      checker(rgivenshape(10,s),s)
      checker(rgivenshape(s),s)
  }

  
  
})
