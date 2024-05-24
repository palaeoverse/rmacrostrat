test_that("def_measurements works", {
  rmacrostrat_test_checks(fn = def_measurements,
                          check_args = list(measure_id = c(1, 2, 4),
                                            measurement_class = "geochemical"),
                          fail_args = list(# wrong argument
                                           measure_group = 70,
                                           # wrong type
                                           measure_id = "test"),
                          warn_args = list(measurement_class = "test"),
                          col_no = 5, check_null = TRUE)
})
