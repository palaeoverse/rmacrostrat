test_that("def_references works", {
  rmacrostrat_test_checks(fn = def_references,
                          check_args = list(ref_id = c(1, 2, 3)),
                          fail_args = list(# wrong argument
                                           ref_group = 70,
                                           # wrong type
                                           ref_id = "test"),
                          warn_args = list(ref_id = -604),
                          col_no = 7, check_null = TRUE)
})
