test_that("def_minerals works", {
  rmacrostrat_test_checks(fn = def_minerals,
                          check_args = list(mineral_type = "element"),
                          fail_args = list(# wrong argument
                                           mineral_group = 70,
                                           # wrong type
                                           mineral_type = 1),
                          warn_args = list(mineral_type = "test"),
                          col_no = 11, check_null = TRUE)
})
