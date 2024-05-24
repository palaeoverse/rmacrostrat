test_that("def_lithologies works", {
  rmacrostrat_test_checks(fn = def_lithologies,
                          check_args = list(lithology = "sandstone",
                                            lithology_type = "sedimentary",
                                            lithology_id = c(1,5)),
                          fail_args = list(# wrong argument
                                           lithology_group = 70,
                                           # wrong type
                                           lithology = 1),
                          warn_args = list(lithology = "test"),
                          col_no = 8, check_null = TRUE)
})
