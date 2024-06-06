test_that("get_eodp works", {
  rmacrostrat_test_checks(fn = get_eodp,
                          def_args = list(sf = TRUE),
                          check_args = list(column_id = c(5081, 5082),
                                            site = "U1351",
                                            leg = "317",
                                            program = "IODP"),
                          fail_args = list(# wrong argument
                                           column_group = 1,
                                           # wrong type
                                           column_id = "test"),
                          warn_args = list(column_id = -500),
                          col_no = 11)
  rmacrostrat_test_checks(fn = get_eodp,
                          def_args = list(sf = FALSE),
                          check_args = list(column_id = c(5081, 5082),
                                            site = "U1351",
                                            leg = "317",
                                            program = "IODP"),
                          fail_args = list(# wrong argument
                                           column_group = 1,
                                           # wrong type
                                           column_id = "test"),
                          warn_args = list(column_id = -500),
                          col_no = 12)
})
