# fn: the name of the function to be tested
# col_no: the number of columns expected (when sf = FALSE)
# def_args: the default arguments to use for all tests
# check_args: sets of arguments to check, all of which should PASS
# fail_args: sets of arguments to check, all of which should FAIL
# warn_args: sets of arguments to check, all of which should throw warnings
# check_sf: whether to check the function with both sf = FALSE and sf = TRUE
#   note that some endpoints return different numbers of columns depending on
#   the format, so you may need to run the checks separately using `def_args`
# check_null: whether to check the function with ONLY the default arguments
rmacrostrat_test_checks <- function(fn, col_no, def_args = list(),
                                    check_args = list(), fail_args = list(),
                                    warn_args = list(),
                                    check_sf = FALSE, check_null = FALSE) {
  skip_if_offline(host = "macrostrat.org")
  if (check_sf) {
    # check explicitly with sf
    def_args$sf <- TRUE
    generic_checks(fn, col_no + 1, def_args, check_args, fail_args, warn_args,
                   clss = c("data.frame", "sf"), check_null = check_null)
    # check explicitly without sf
    def_args$sf <- FALSE
    generic_checks(fn, col_no, def_args, check_args, fail_args, warn_args,
                   clss = "data.frame", not_clss = "sf",
                   check_null = check_null)
  } else {
    generic_checks(fn, col_no, def_args, check_args, fail_args, warn_args,
                   clss = "data.frame", check_null = check_null)
  }
}

generic_checks <- function(fn, col_no, args, check_args, fail_args, warn_args,
                           clss = c(), not_clss = c(), check_null = FALSE) {
  # check with default arguments (pass if sf is the only argument)
  if (check_null) {
    dat <- do.call(fn, args)
    for (cls in clss) {
      expect_true(is(dat, cls),
                  label = paste0("Whether the specified args (",
                                 paste0(names(args), " = ",
                                        args, collapse = "; "),
                                 ") returned a ", cls, " object"))
    }
    for (cls in not_clss) {
      expect_false(is(dat, cls),
                   label = paste0("Whether the specified args (",
                                  paste0(names(args), " = ",
                                         args, collapse = "; "),
                                  ") returned a ", cls, " object"))
    }
    expect_equal(ncol(dat), col_no,
                 label = paste0("Number of returned columns (", ncol(dat),
                                ") for args (",
                                paste0(names(args), " = ",
                                       args, collapse = "; "),
                                ")"))
    expect_true(nrow(dat) >= 1,
                label = paste0("Whether the specified args (",
                               paste0(names(args), " = ",
                                      args, collapse = "; "),
                               ") returned at least one row"))
  }
  # check individual passing arguments
  for (i in seq_along(check_args)) {
    full_args <- comb_lists(args, check_args, i)
    dat <- do.call(fn, full_args)
    for (cls in clss) {
      expect_true(is(dat, cls),
                  label = paste0("Whether the specified args (",
                                 paste0(names(full_args), " = ",
                                        full_args, collapse = "; "),
                                 ") returned a ", cls, " object"))
    }
    for (cls in not_clss) {
      expect_false(is(dat, cls),
                   label = paste0("Whether the specified args (",
                                  paste0(names(full_args), " = ",
                                         full_args, collapse = "; "),
                                  ") returned a ", cls, " object"))
    }
    expect_equal(ncol(dat), col_no,
                 label = paste0("Number of returned columns (", ncol(dat),
                                ") for args (",
                                paste0(names(full_args), " = ",
                                       full_args, collapse = "; "),
                                ")"))
    expect_true(nrow(dat) >= 1,
                label = paste0("Whether the specified args (",
                               paste0(names(full_args), " = ",
                                      full_args, collapse = "; "),
                               ") returned at least one row"))
  }
  # check individual failing arguments
  for (i in seq_along(fail_args)) {
    full_args <- comb_lists(args, fail_args, i)
    suppressMessages(expect_error(
      do.call(fn, full_args),
      label = paste0("Using the specified args (",
                     paste0(names(full_args), " = ",
                            full_args, collapse = "; "), ")")
    ))
  }
  for (i in seq_along(warn_args)) {
    full_args <- comb_lists(args, warn_args, i)
    expect_warning(do.call(fn, full_args),
                   label = paste0(
                     "Using the specified args (",
                     paste0(names(full_args), " = ",
                            full_args, collapse = "; "),
                     ")"
                   ))
  }
}

comb_lists <- function(lst1, lst2, i) {
  if (is.list(lst2[[i]])) {
    return(c(lst1, lst2[[i]]))
  } else {
    return(c(lst1, lst2[i]))
  }
}
