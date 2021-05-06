test_that("Test suite aac.R",{

    options("print_word_as_cycle" = FALSE)
    expect_output(print(rperm(3,4)))
    expect_output(print(id))
    expect_output(print(as.word(id)))
    expect_output(print(rperm(1,100)))
    expect_output(print(nullcycle))

    options("print_word_as_cycle" = TRUE)
    expect_output(print(rperm(3,4)))
    expect_output(print(id))
    expect_output(print(as.word(id)))
    expect_output(print(rperm(1,100)))
    expect_output(print(nullcycle))

})
