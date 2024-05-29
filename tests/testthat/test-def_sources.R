test_that("def_sources works", {
  rmacrostrat_test_checks(fn = def_sources, def = list(sf = TRUE),
                          check_args = list(source_id = c(1,2,4),
                                            list(lat = 43.03, lng = -89.4,
                                                 scale = "large")),
                          fail_args = list(lat = 43.03, # needs lng
                                           # invalid lng
                                           list(lat = 43.03, lng = -200),
                                           # invalid lat
                                           list(lat = 200, lng = -89.4),
                                           # wrong argument
                                           source_group = 70,
                                           # wrong type
                                           source_id = "test"),
                          warn_args = list(source_id = -604),
                          col_no = 12, check_null = TRUE)

  rmacrostrat_test_checks(fn = def_sources, def = list(sf = FALSE),
                          check_args = list(source_id = c(1,2,4),
                                            list(lat = 43.03, lng = -89.4,
                                                 scale = "large")),
                          fail_args = list(lat = 43.03, # needs lng
                                           # invalid lng
                                           list(lat = 43.03, lng = -200),
                                           list(lat = 200, lng = -89.4),
                                           # wrong argument
                                           source_group = 70,
                                           # wrong type
                                           source_id = "test"),
                          warn_args = list(source_id = -604),
                          col_no = 11, check_null = TRUE)
})
