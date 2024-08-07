% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_map_points.R
\name{get_map_points}
\alias{get_map_points}
\title{Retrieve geologic map point shape element data}
\usage{
get_map_points(
  point_id = NULL,
  point_type = NULL,
  min_lat = NULL,
  min_lng = NULL,
  max_lat = NULL,
  max_lng = NULL,
  source_id = NULL,
  sf = TRUE
)
}
\arguments{
\item{point_id}{\code{integer}. The unique identification number(s) of the
point(s) to return.}

\item{point_type}{\code{character}. Filter points to those of one or more
point type(s). Options are "cleavage", "bedding", "axial plane", "fault
plane", "foliation", and "joint". Ignored if \code{point_id} is supplied.}

\item{min_lat}{\code{integer}. The minimum latitude used to define the
bounding box of the points to return. Requires \code{min_lng}, \code{max_lat}, and
\code{max_lng}. Ignored if \code{point_id} is supplied.}

\item{min_lng}{\code{integer}. A minimum longitude used to define the
bounding box of the points to return. Requires \code{min_lat}, \code{max_lat}, and
\code{max_lng}. Ignored if \code{point_id} is supplied.}

\item{max_lat}{\code{integer}. A maximum latitude used to define the
bounding box of the points to return. Requires \code{min_lat}, \code{min_lng}, and
\code{max_lng}. Ignored if \code{point_id} is supplied.}

\item{max_lng}{\code{integer}. A maximum longitude used to define the
bounding box of the points to return. Requires \code{min_lat}, \code{min_lng}, and
\code{max_lat}. Ignored if \code{point_id} is supplied.}

\item{source_id}{\code{integer}. The unique identification number(s) of the
source(s) to filter the points by. Ignored if \code{point_id} is supplied.}

\item{sf}{\code{logical}. Should the results be returned as an \code{sf} object?
Defaults to \code{TRUE}.}
}
\value{
An \code{sf} object containing the following columns:
\itemize{
\item \code{point_id}: The identification number of the point element.
\item \code{strike}: The strike value of the point element.
\item \code{dip}: The dip value of the point element.
\item \code{dip_dir}: The dip direction of the point element.
\item \code{point_type}: The type of point element (e.g. "bedding").
\item \code{certainty}: The certainty of the point element location.
\item \code{comments}: Notes assigned to the point element.
\item \code{source_id}: The unique identification number of the source
for the point element.
\item \code{geometry}: The point spatial data.
}
If \code{sf} is \code{TRUE} (the default), an \code{sf} object is returned, with the
a "geometry" column that contains the spatial data. If \code{sf} is \code{FALSE},
a \code{data.frame} object is returned with two additional columns (lng,
lat) containing the geographic coordinates of the point elements.
}
\description{
A function to retrieve data for geologic map point shape
elements from various sources.
}
\details{
More information can be found relating to the inputs for this
function using the definition functions (beginning with \code{def_}).
}
\section{Developer(s)}{

Lewis A. Jones
}

\section{Reviewer(s)}{

Bethany Allen
}

\examples{
\donttest{
# Return a specific point
ex1 <- get_map_points(point_id = 1)
# Return all points within a user-specified bounding box
ex2 <- get_map_points(min_lng = -80, min_lat = 40,
                      max_lng = -70, max_lat = 50)
}
}
\seealso{
Geologic maps:
\code{\link{def_sources}()},
\code{\link{get_map_legends}()},
\code{\link{get_map_outcrop}()}
}
\concept{maps}
