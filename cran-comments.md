## CRAN manual review comments

* Please always write package names, software names and API (application programming interface) names in single quotes in title and description.
e.g: --> 'Macrostrat'  
**DONE.**

* \dontrun{} should only be used if the example really cannot be executed (e.g. because of missing additional software, missing API keys, ...) by the user. That's why wrapping examples in \dontrun{} adds the comment ("# Not run:") as a warning for the user. Does not seem necessary. Please replace \dontrun with \donttest.
Please unwrap the examples if they are executable in < 5 sec, or replace dontrun{} with \donttest{}.  
**DONE.**

* Please do not install packages in your functions, examples or vignette. This can make the functions,examples and cran-check very slow.
-> inst/doc/geologic-map.R  
**VIGNETTES NOW PRE-COMPILED.**

## Test environments (with Github Actions)

* Windows 10.0.20348 (Windows Server 2022 x64): R 4.4.1
* macOS Sonoma 14.5 (aarch64-apple-darwin20): R 4.4.1
* Ubuntu-release 22.04.4 LTS (x86_64-pc-linux-gnu): R 4.4.1
* Ubuntu-devel 22.04.4 LTS (x86_64-pc-linux-gnu): r86913
* Ubuntu-oldrel 22.04.4 LTS (x86_64-pc-linux-gnu): 4.3.3

## R CMD check results

0 errors | 0 warnings | 2 note

* This is a new release.

* Suggests or Enhances not in mainstream repositories:
    rnaturalearthhires
  Availability using Additional_repositories specification:
    rnaturalearthhires   yes   http://packages.ropensci.org
