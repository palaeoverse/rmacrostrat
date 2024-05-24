test_that("def_structures works", {
  rmacrostrat_test_checks(fn = def_structures,
                          check_args = list(structure_id = c(1, 3),
                                            structure_class = "igneous"),
                          fail_args = list(# wrong argument
                                           structure_group = 70,
                                           # wrong type
                                           structure_id = "test"),
                          warn_args = list(structure_id = -604),
                          col_no = 5, check_null = TRUE)
})
