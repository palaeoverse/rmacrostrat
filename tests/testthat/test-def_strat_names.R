test_that("def_strat_names works", {
  rmacrostrat_test_checks(fn = def_strat_names,
                          check_args = list(strat_name = "Hell Creek",
                                            list(interval_name = "Campanian",
                                                 rank = "Fm")),
                          fail_args = list(# wrong argument
                                           strat_group = 70,
                                           # wrong type
                                           strat_name = 1,
                                           # wrong rule
                                           rule = "test"),
                          warn_args = list(strat_name = "test",
                                           # warning when using rule incorrectly
                                           rule = "all"),
                          col_no = 24, check_null = TRUE)
})
