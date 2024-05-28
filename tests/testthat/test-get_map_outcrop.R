test_that("get_map_outcrop works", {
  rmacrostrat_test_checks(fn = get_map_outcrop,
                          def_args = list(sf = FALSE),
                          check_args = list(list(lat = 43, lng = -89.3),
                                            list(lat = 43, lng = -89.3,
                                                 scale = "tiny")),
                          fail_args = list(lat = 43, # needs lng
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # invalid latitude value
                                           list(lat = 110, lng = -89.3),
                                           # wrong argument
                                           scaley = TRUE,
                                           # wrong type
                                           list(scale = 5)),
                          warn_args = list(map_id = -10),
                          col_no = 20)
  rmacrostrat_test_checks(fn = get_map_outcrop,
                          def_args = list(sf = TRUE),
                          check_args = list(list(lat = 43, lng = -89.3),
                                            list(lat = 43, lng = -89.3,
                                                 scale = "tiny")),
                          fail_args = list(lat = 43, # needs lng
                                           # invalid longitude value
                                           list(lat = 43, lng = -300),
                                           # invalid latitude value
                                           list(lat = 110, lng = -89.3),
                                           # wrong argument
                                           scaley = TRUE,
                                           # wrong type
                                           list(scale = 5)),
                          warn_args = list(map_id = -10),
                          col_no = 21)
})
