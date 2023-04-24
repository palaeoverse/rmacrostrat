test_that("get_stats works", {
  skip_if_offline(host = "macrostrat.org")

  expect_true(is.data.frame(get_stats()))
  expect_true(is.data.frame(get_stats(x = "North America")))
  expect_true(is.vector(get_stats(available = TRUE)))

  expect_error(get_stats(x = 1))
  expect_error(get_stats(x = "waffles"))
  expect_error(get_stats(available = 1))
})
