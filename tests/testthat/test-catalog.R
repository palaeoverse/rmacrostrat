test_that("catalog works", {
  rmacrostrat_test_checks(fn = catalog, col_no = 8,
                          check_args = list(type = "grain_sizes"),
                          fail_args = list(type = 1,
                                           type = "test",
                                           list(type = NULL)))
  rmacrostrat_test_checks(fn = catalog, col_no = 11,
                          check_args = list(type = "minerals"))
})
