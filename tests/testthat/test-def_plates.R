test_that("def_plates works", {
  rmacrostrat_test_checks(fn = def_plates,
                          check_args = list(plate_id = 604),
                          fail_args = list(# wrong argument
                                           plate_group = 70,
                                           # wrong type
                                           plate_id = "test"),
                          warn_args = list(plate_id = -604),
                          col_no = 2, check_null = TRUE)
})
