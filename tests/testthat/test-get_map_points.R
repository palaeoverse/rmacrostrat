test_that("get_map_points works", {
  rmacrostrat_test_checks(fn = get_map_points,
                          check_args = list(point_id = 1,
                                            list(min_lng = -80, min_lat = 40,
                                                 max_lng = -70, max_lat = 50)),
                          fail_args = list(min_lat = 43, # needs other args
                                           # invalid lat/lng values
                                           list(min_lng = -80, min_lat = -200,
                                                max_lng = -70, max_lat = 50),
                                           list(min_lng = -80, min_lat = 40,
                                                max_lng = -70, max_lat = 300),
                                           list(min_lng = -200, min_lat = 40,
                                                max_lng = -70, max_lat = 50),
                                           list(min_lng = -80, min_lat = 40,
                                                max_lng = 200, max_lat = 50),
                                           list(min_lng = -80, min_lat = 40,
                                                max_lng = -70, max_lat = 30),
                                           list(min_lng = -80, min_lat = 40,
                                                max_lng = -90, max_lat = 50),
                                           # wrong argument
                                           lithology_set = "sedimentary",
                                           # wrong type
                                           point_id = "test"),
                          warn_args = list(point_id = -1),
                          col_no = 9)
  expect_true(is.data.frame(get_map_points(point_id = 1, sf = FALSE)))
  expect_false(any(class(get_map_points(point_id = 1, sf = FALSE)) == "sf"))
})
