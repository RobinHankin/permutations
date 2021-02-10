test_that("Test suite aac.R",{
    expect_warning(singleword_valid(c(1,1,2)))
    expect_error(as.cycle(c(1,2,-4)))
    expect_error(as.cycle(c(1,2,0)))
    expect_error(as.cycle(c(1,2,3.5)))

    options(warn = -1)
    expect_false(cyclist_valid(c(1,-2)))
    expect_false(cyclist_valid(c(1,0)))
    expect_false(cyclist_valid(c(1,1)))
    expect_false(cyclist_valid(c(1,1.5)))

    expect_error(cycle(list(list(c(1,8,2),c(3,3)),list(1:2, 4:8))))


    options(warn = 0)

    expect_error(permutation(1:4))
    expect_true(is.id(permutation(rbind(1:4,4:1))[1]))
    expect_true(is.cycle(permutation(c("(1,4)(6,7)","(3,4,2)(8,19)", "(56)","(12345)(78)","(78)"))))
    expect_true(is.cycle(permutation(list(1:4))))

    expect_true(is.id(as.word(1)))
    expect_true(is.id(as.word(numeric(0))))

    expect_false(is.id.list(nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)))))
    expect_true(is.id.list(nicify_cyclist(list())))

    jj <- rperm(5,3)
    names(jj) <- letters[1:5]
    expect_true(all(names(jj) == letters[1:5]))

    expect_true(is.permutation(rperm(4,3)))
    expect_false(is.permutation(ls))
    expect_true(length(is.id(nullword))==0)

    expect_true(all(unlist(shape(c(cyc_len(3),cyc_len(5))))==c(3,5)))
    expect_true(length(c(as.word(rperm(7,8)),as.word(rperm(7,8))))==14)
    expect_error(c(rperm(3,4),as.cycle(rperm(3,4))))
    expect_error(c(as.cycle(rperm(3,4)),rperm(3,4)))
    expect_true(all(is.id(permutation(addcols(as.word(rep(id,5)),4)))))

    expect_true(0 %in% dim(addcols(matrix(0,0,0),4)))

    expect_warning(as.word(array(1:12, c(2, 2, 3))))
    expect_error(addcols(rperm(5,4),2))
    expect_error(as.word(ls))

    expect_true(is.id(as.cycle()))

    expect_error(as.cycle(ls))
})
