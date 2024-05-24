test_that("def_strat_name_concepts works", {
  rmacrostrat_test_checks(fn = def_strat_name_concepts,
                          check_args = list(strat_concept_name = "Dakota",
                                            strat_concept_id = 8212),
                          fail_args = list(# wrong argument
                                           strat_concept_group = 70,
                                           # wrong type
                                           strat_concept_id = "test"),
                          warn_args = list(strat_concept_id = -604),
                          col_no = 12, check_null = TRUE)
})
