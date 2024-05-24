test_that("get_columns works", {
  rmacrostrat_test_checks(fn = get_columns,
                          def_args = list(interval_name = "Permian"),
                          check_args = list(strat_name = "mancos",
                                            list(lat = 43, lng = -89)),
                          fail_args = list(lat = 43),
                          col_no = 24, check_sf = TRUE)
})
