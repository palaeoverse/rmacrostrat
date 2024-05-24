test_that("def_intervals works", {
  rmacrostrat_test_checks(fn = def_intervals,
                          check_args = list(timescale = "international ages",
                                            list(timescale =
                                                   "international ages",
                                                 age = 70)),
                          fail_args = list(# wrong argument
                                           timeage = 70,
                                           # wrong type
                                           timescale = 1),
                          warn_args = list(timescale = "test"),
                          col_no = 8, check_null = TRUE)
})
