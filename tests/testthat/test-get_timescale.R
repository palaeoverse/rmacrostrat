test_that("get_timescale works", {
  skip_if_offline(host = "macrostrat.org")

  expect_true(is.data.frame(get_timescale(x = "international ages")))
  expect_true(is.vector(get_timescale(available = TRUE)))

  expect_error(get_timescale(x = 1))
  expect_error(get_timescale(available = 1))
})
