test_that("get_sections works", {
  rmacrostrat_test_checks(fn = get_sections,
                          check_args = list(section_id = 1,
                                            column_id = 10,
                                            age = 73,
                                            list(lat = 45, lng = -100),
                                            list(age_top = 70,
                                                 age_bottom = 75),
                                            lithology = "sandstone",
                                            environ_type = "siliciclastic"),
                          fail_args = list(lat = 43, # needs lng
                                           lng = 43, # needs lat
                                           age_top = 50, # needs age_bottom
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # invalid latitude value
                                           list(lat = 110, lng = -100),
                                           # age_top must be less
                                           list(age_top = 100, age_bottom = 50),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           section_id = "test"),
                          warn_args = list(section_id = -50),
                          col_no = 12)
})
