# fn: the name of the function to be tested
# col_no: the number of columns expected (when sf = FALSE)
# def_args: the default arguments to use for all tests
# check_args: sets of arguments, if any, to check which should PASS
# fail_args: sets of arguments, if any, to check which should FAIL
# check_sf: whether to check the function with both sf = FALSE and sf = TRUE
rmacrostrat_test_checks <- function(fn, col_no, def_args = list(),
                                    check_args = list(), fail_args = list(),
                                    check_sf = FALSE) {
  skip_if_offline(host = "macrostrat.org")
  if (check_sf) {
    # check explicitly with sf
    generic_checks(fn, col_no + 1, c(def_args, sf = TRUE),
                   check_args, fail_args, clss = c("data.frame", "sf"))
    # check explicitly without sf
    generic_checks(fn, col_no, c(def_args, sf = FALSE),
                   check_args, fail_args, clss = "data.frame",
                   not_clss = "sf")
  } else {
    generic_checks(fn, col_no, def_args, check_args, fail_args,
                   clss = "data.frame")
  }
}

generic_checks <- function(fn, col_no, args, check_args, fail_args,
                           clss = c(), not_clss = c()) {
  # check with default arguments
  dat <- do.call(fn, args)
  for (cls in clss) {
    expect_true(is(dat, cls))
  }
  for (cls in not_clss) {
    expect_false(is(dat, cls))
  }
  expect_equal(ncol(dat), col_no)
  expect_true(nrow(dat) >= 1)
  # check individual passing arguments
  for (i in seq_along(check_args)) {
    dat <- do.call(fn, c(args, unlist(check_args[i])))
    for (cls in clss) {
      expect_true(is(dat, cls))
    }
    for (cls in not_clss) {
      expect_false(is(dat, cls))
    }
    expect_equal(ncol(dat), col_no)
    expect_true(nrow(dat) >= 1)
  }
  # check individual failing arguments
  for (i in seq_along(fail_args)) {
    expect_error(do.call(fn, c(args, unlist(fail_args[i]))))
  }
}
