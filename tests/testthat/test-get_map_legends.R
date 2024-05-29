test_that("get_map_legends works", {
  rmacrostrat_test_checks(fn = get_map_legends,
                          check_args = list(source_id = 1,
                                            lithology_type = "sedimentary",
                                            comments = "breccia"),
                          fail_args = list(# wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           source_id = "test",
                                           # invalid values
                                           scale = "teeny",
                                           carto = "teeny"),
                          warn_args = list(source_id = -1),
                          col_no = 24)
})
