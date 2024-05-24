test_that("def_environments works", {
  rmacrostrat_test_checks(fn = def_environments,
                          check_args = list(environ = "reef",
                                            environ_type = "carbonate",
                                            environ_class = "marine"),
                          fail_args = list(# wrong argument
                                           environ_group = "reef",
                                           # wrong type
                                           environ_group = 1),
                          warn_args = list(environ_type = "test"),
                          col_no = 6, check_null = TRUE)
})
