test_that("def_lithology_att works", {
  rmacrostrat_test_checks(fn = def_lithology_att,
                          check_args = list(att_type = "sed structure"),
                          fail_args = list(# wrong argument
                                           att_group = 70,
                                           # wrong type
                                           att_type = 1),
                          warn_args = list(att_type = "test"),
                          col_no = 4, check_null = TRUE)
})
