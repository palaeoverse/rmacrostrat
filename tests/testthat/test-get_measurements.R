test_that("get_measurements works", {
  rmacrostrat_test_checks(fn = get_measurements,
                          def_args = list(sf = TRUE),
                          check_args = list(measure_id = c(353, 354),
                                            measurement_id = 42,
                                            list(column_id = 84,
                                                 measurement = "SiO2")),
                          fail_args = list(# wrong argument
                                           measurement_group = "sedimentary",
                                           # wrong type
                                           measure_id = "test"),
                          warn_args = list(measure_id = -10),
                          col_no = 27)
  rmacrostrat_test_checks(fn = get_measurements,
                          def_args = list(sf = FALSE),
                          check_args = list(measure_id = c(353, 354),
                                            measurement_id = 42,
                                            list(column_id = 84,
                                                 measurement = "SiO2")),
                          fail_args = list(# wrong argument
                            measurement_group = "sedimentary",
                            # wrong type
                            measure_id = "test"),
                          warn_args = list(measure_id = -10),
                          col_no = 28)
})
