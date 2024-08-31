test_that("Test suite aaj.R; stabilizer()", {

  `checker` <- function(x,s) {
      stab_s <- stabilizer(x,s)
      if(length(stab_s) > 0){
          for(i in seq_along(s)){
              expect_true(all(s[i] ^ stab_s %in% s))
          }
      }
  }

  for (i in 1:3) {
      checker(rperm(20,r=9),sample(9,1,replace=FALSE))
      checker(rperm(20,r=9),sample(9,3,replace=FALSE))
      checker(rperm(20,r=9),sample(9,5,replace=FALSE))
      checker(rperm(20,r=9),sample(9,7,replace=FALSE))
  }
  
})
