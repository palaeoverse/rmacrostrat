test_that("def_columns works", {
  rmacrostrat_test_checks(fn = def_columns,
                          check_args = list(column_group_id = 17,
                                            column_name = "Eastern Kentucky"),
                          fail_args = list(# wrong argument
                                           column_system = 15,
                                           # wrong type
                                           column_name = 1),
                          warn_args = list(column_name = "test"),
                          col_no = 12, check_null = TRUE)
})
