test_that("def_projects works", {
  rmacrostrat_test_checks(fn = def_projects,
                          check_args = list(project_id = 4),
                          fail_args = list(# wrong argument
                                           project_group = 70,
                                           # wrong type
                                           project_id = "test"),
                          warn_args = list(project_id = -604),
                          col_no = 9, check_null = TRUE)
})
