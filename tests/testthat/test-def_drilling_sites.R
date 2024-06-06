test_that("def_drilling_sites works", {
  rmacrostrat_test_checks(fn = def_drilling_sites,
                          def_args = list(sf = TRUE),
                          check_args = list(site = "U1547", exp = "385"),
                          fail_args = list(# wrong argument
                                           program_id = 1,
                                           # wrong type
                                           program = 1),
                          warn_args = list(site = "test"),
                          col_no = 18, check_null = TRUE)
  rmacrostrat_test_checks(fn = def_drilling_sites,
                          def_args = list(sf = FALSE),
                          check_args = list(site = "U1547", exp = "385"),
                          fail_args = list(# wrong argument
                                           program_id = 1,
                                           # wrong type
                                           program = 1),
                          warn_args = list(site = "test"),
                          col_no = 19, check_null = TRUE)
})
