test_that("get_fossils works", {
  rmacrostrat_test_checks(fn = get_fossils,
                          check_args = list(column_id = 10,
                                            unit_id = 6279,
                                            list(lithology = "sandstone",
                                                 age_top = 66,
                                                 age_bottom = 73),
                                            list(environ_type = "fluvial",
                                                 age =  253)),
                          fail_args = list(age_top = 50, # needs age_bottom
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # age_top must be less
                                           list(age_top = 100, age_bottom = 50),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           column_id = "test"),
                          warn_args = list(column_id = -10),
                          col_no = 11, check_sf = TRUE)
})
