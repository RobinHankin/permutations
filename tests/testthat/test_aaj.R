test_that("Test suite aaj.R; stabilizer()", {

  `checker` <- function(x,s) {
      stab_s <- stabilizer(x,s)
      if(length(stab_s) > 0){
          for(si in s){
              if(si <= size(stab_s)){
                  expect_true(all(si ^ stab_s %in% s))
              }
          }
      }
  }
  
  for (i in 1:3) {
      checker(rperm(20,r=9),sample(9,1,replace=FALSE))
      checker(rperm(20,r=9),sample(9,3,replace=FALSE))
      checker(rperm(20,r=9),sample(9,5,replace=FALSE))
      checker(rperm(20,r=9),sample(9,7,replace=FALSE))
  }

  a <- c(as.cycle("(23)(567)"), as.cycle("(14)(26)"), as.cycle("(14)(56)"))
  expect_true(all(stabilizes(a, 2:3, strict=TRUE ) == c(FALSE, FALSE, TRUE)))
  expect_true(all(stabilizes(a, 2:3, strict=FALSE) == c(TRUE , FALSE, TRUE)))

  
})
