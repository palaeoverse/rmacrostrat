test_that("get_timescale works", {
  skip_if_offline(host = "macrostrat.org")

  expect_true(is.data.frame(get_timescale(query = list(
    timescale = "international ages"))))
  expect_true(is.vector(get_timescale(params = TRUE)))
  expect_true(is.vector(get_timescale(available = TRUE)))
  # Check format replacement
  expect_true(is.data.frame(get_timescale(query = list(
    timescale = "international ages", format = "json"))))

  expect_error(get_timescale(query = 1))
  expect_error(get_timescale(available = 1))
  expect_error(get_timescale(params = 1))
  expect_error(get_timescale(query = list(waffles = "& pancakes")))
})
