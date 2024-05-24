test_that("get_paleogeography works", {
  rmacrostrat_test_checks(fn = get_paleogeography,
                          check_args = list(age = 250,
                                            interval_name = "Campanian"),
                          fail_args = list(# wrong argument
                                           interval_age = 50,
                                           # wrong type
                                           age = "test",
                                           list()),
                          col_no = 2)
})
