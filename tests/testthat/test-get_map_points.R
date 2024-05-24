test_that("get_map_points works", {
  rmacrostrat_test_checks(fn = get_map_points,,
                          check_args = list(point_id = 1,
                                            list(min_lng = -80, min_lat = 40,
                                                 max_lng = -90, max_lat = 50)),
                          fail_args = list(min_lat = 43, # needs other args
                                           # invalid longitude value
                                           list(min_lng = -80, min_lat = 40,
                                                max_lng = -90, max_lat = 300),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           point_id = "test"),
                          warn_args = list(point_id = -1),
                          col_no = 9)
})
