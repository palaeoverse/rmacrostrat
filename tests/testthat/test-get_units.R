test_that("get_units works", {
  rmacrostrat_test_checks(fn = get_units,
                          def_args = list(sf = TRUE),
                          check_args = list(strat_name = "Hell Creek",
                                            list(lng = -110.9, lat = 48.4)),
                          fail_args = list(lat = 43, # needs lng
                                           lng = -110.9, #needs lat
                                           age_top = 50, # needs age_bottom
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # invalid latitude value
                                           list(lat = -100, lng = 48.4),
                                           # age_top must be less
                                           list(age_top = 100, age_bottom = 50),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           column_id = "test"),
                          warn_args = list(column_id = -10),
                          col_no = 42)
  rmacrostrat_test_checks(fn = get_units,
                          def_args = list(sf = FALSE),
                          check_args = list(strat_name = "Hell Creek",
                                            list(lng = -110.9, lat = 48.4)),
                          fail_args = list(lat = 43, # needs lng
                                           lng = -110.9, #needs lat
                                           age_top = 50, # needs age_bottom
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # invalid latitude value
                                           list(lat = -100, lng = 48.4),
                                           # age_top must be less
                                           list(age_top = 100, age_bottom = 50),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           column_id = "test"),
                          warn_args = list(column_id = -10),
                          col_no = 43)
})
