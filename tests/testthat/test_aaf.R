test_that("Test suite aaf.R; allcyc()", {

  checker1 <- function(x) {
      ax <- allcyc(x)
      f <- as.function(ax)
      
      expect_false(any(is.id(ax)))
      expect_true(as.cycle(x) %in% ax)
      expect_true(all(f(x[1]) %in% x))
      for(xi in x){expect_false(any(f(xi) == xi))}
      for(xi in x){expect_true (all(f(xi) != xi))}
  }

  for (i in 1:5) {
      checker1(sample(9,5,replace=FALSE))
  }

})
