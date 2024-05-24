test_that("def_econs works", {
  rmacrostrat_test_checks(fn = def_econs,
                          check_args = list(econ_type = "hydrocarbon"),
                          fail_args = list(# wrong argument
                                           econ_group = "hydrocarbon",
                                           # wrong type
                                           econ_type = 1),
                          warn_args = list(econ_type = "test"),
                          col_no = 6, check_null = TRUE)
})
