test_that("get_columns works", {
  rmacrostrat_test_checks(fn = get_columns,
                          check_args = list(interval_name = "Permian",
                                            strat_name = "mancos",
                                            list(lat = 43, lng = -89),
                                            list(age_top = 100,
                                                 age_bottom = 150)),
                          fail_args = list(lat = 43, # needs lng
                                           age_top = 50, # needs age_bottom
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # invalid latitude value
                                           list(lat = -100, lng = -89),
                                           # age_top must be less
                                           list(age_top = 100, age_bottom = 50),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           column_id = "test"),
                          warn_args = list(lithology_class = "sedigneous"),
                          col_no = 24, check_sf = TRUE)
})
