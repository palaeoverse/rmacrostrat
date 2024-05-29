test_that("get_age_model works", {
  rmacrostrat_test_checks(fn = get_age_model,
                          check_args = list(column_id = c(503, 504)),
                          fail_args = list(# wrong argument
                                           column_group = 4,
                                           # wrong type
                                           column_id = "test",
                                           # No input
                                           NULL),
                          warn_args = list(column_id = -503),
                          col_no = 15)
})
