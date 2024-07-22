test_that("utils works", {
  expect_true(check_arguments(x = list(a = 1, b = "test", c = list(y = 0)),
                              ref = list(a = "integer", b = "character",
                                         c = "list")))

  suppressMessages(expect_error(
    check_arguments(x = list(a = 1, b = "test", c = list(y = 0)),
                    ref = list(a = "character", b = "character",
                               c = "list"))))

  expect_error(check_arguments(x = list(x = 1, b = "test", c = list(y = 0)),
                               ref = list(a = "integer", b = "character",
                                          c = "list")))

  expect_length(filter_args(list(a = NULL, b = 1, c = NULL)), 1)
})
