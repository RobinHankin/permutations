test_that("Test suite aak.R; keepcyc()", {

  `checker` <- function(x, f, ...) {  # idempotence of keepcyc()
      expect_true(
          all(        keepcyc(x, f, ...) ==
              keepcyc(keepcyc(x, f, ...), f, ...)))
  }
  
  checker(rperm(20,r=9),f=function(x){length(x) < 4})
  checker(rperm(20,r=9),f=function(x){max(x) < 7})
  checker(rperm(20,r=9),f=function(x){max(x) - min(x) < 3})
  
  expect_true(
      keepcyc(as.cycle("(189)(23)(56)"),function(x){all(x<5)}) ==
      as.cycle("(23)")
  )


} )
