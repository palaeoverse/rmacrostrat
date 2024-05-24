test_that("def_grain_sizes works", {
  rmacrostrat_test_checks(fn = def_grain_sizes,
                          check_args = list(grain_group = "Gravel"),
                          fail_args = list(# wrong argument
                                           grain_system = "Gravel",
                                           # wrong type
                                           grain_group = 1),
                          warn_args = list(grain_group = "test"),
                          col_no = 8, check_null = TRUE)
})
