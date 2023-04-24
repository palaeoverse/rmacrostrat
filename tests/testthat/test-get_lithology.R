test_that("get_lithology works", {
  skip_if_offline(host = "macrostrat.org")

  expect_equal(nrow(get_lithology(x = "sandstone")), 1)
  expect_true(is.vector(get_lithology(available = TRUE)))
  expect_true(is.data.frame(get_lithology(
    x = "unconsolidated",
    by = "group", available = FALSE
  )))

  expect_error(get_lithology(x = 1))
  expect_error(get_lithology(available = 1))
})
