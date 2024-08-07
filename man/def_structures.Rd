% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/def_structures.R
\name{def_structures}
\alias{def_structures}
\title{Define geological structure}
\usage{
def_structures(
  structure = NULL,
  structure_class = NULL,
  structure_type = NULL,
  structure_id = NULL
)
}
\arguments{
\item{structure}{\code{character}. The name of a geological structure
(e.g., "syncline") to return a definition for.}

\item{structure_class}{\code{character}. The name of the geological
structure class (e.g., "sedimentology") to return a definition for.}

\item{structure_type}{\code{character}. The name of the geological
structure type (e.g., "fault") to return a definition for.}

\item{structure_id}{\code{integer}. The unique idenfication number(s) of
geological structures(s) to return a definition for.}
}
\value{
A \code{data.frame} containing the following columns:
\itemize{
\item \code{structure_id}: The unique identification number of the
structure.
\item \code{name}: The name of the structure.
\item \code{structure_type}: Structure type, less inclusive than class.
\item \code{group}: Structure group, less inclusive than type.
\item \code{class}: Structure class, more inclusive than type.
}
}
\description{
A function to retrieve definitions for various geological
structures within the Macrostrat database.
}
\section{Developer(s)}{

William Gearty
}

\section{Reviewer(s)}{

Lewis A. Jones
}

\examples{
\donttest{
# Get all structure definitions
ex1 <- def_structures()
# Get subset of structure definitions
ex2 <- def_structures(structure_id = c(1, 3))
ex3 <- def_structures(structure_class = "igneous")
}
}
\seealso{
Geologic features and attributes:
\code{\link{def_econs}()},
\code{\link{def_environments}()},
\code{\link{def_grain_sizes}()},
\code{\link{def_lithologies}()},
\code{\link{def_lithology_att}()},
\code{\link{def_measurements}()},
\code{\link{def_minerals}()}
}
\concept{defs_feat}
