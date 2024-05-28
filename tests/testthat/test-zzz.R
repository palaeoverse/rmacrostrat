test_that("zzz works", {
  skip_if_offline(host = "macrostrat.org")

  vers <- api_version()
  expect_true(is(vers, "integer"))
  # this is to let us know if the main API version has changed
  expect_equal(vers, 2)

  res1 <- GET_macrostrat("columns", query = list(interval_name = "Permian"),
                         format = "json")
  expect_true(is(res1, "data.frame"))
  expect_true(nrow(res1) > 1)

  res2 <- GET_macrostrat("columns", query = list(interval_name = "Permian"),
                         format = "json", output = "list")
  expect_true(is(res2, "list"))
  expect_true(length(res2) > 1)

  res3 <- GET_macrostrat("columns", query = list(interval_name = "Permian"),
                        format = "csv")
  expect_true(is(res3, "data.frame"))
  expect_true(nrow(res3) > 1)
  expect_equal(ncol(res1), ncol(res3))
  expect_equal(nrow(res1), nrow(res3))

  res4 <- GET_macrostrat("columns", query = list(interval_name = "Permian"),
                         format = "geojson_bare")
  expect_true(is(res4, "data.frame"))
  expect_true(is(res4, "sf"))
  expect_true(nrow(res4) > 1)

  # errors and warnings
  expect_error(GET_macrostrat("get_columns"))
  expect_error(GET_macrostrat("columns", query = list(interval_id = "Permian")))
  expect_error(GET_macrostrat("columns", query = list(interval_id = "Permian"),
                              format = "csv"))
  expect_error(GET_macrostrat("columns", query = list(interval_id = "Permian"),
                              format = "geojson_bare"))
})
