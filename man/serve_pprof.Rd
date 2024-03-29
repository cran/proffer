% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pprof.R
\name{serve_pprof}
\alias{serve_pprof}
\title{Visualize profiling data with pprof.}
\usage{
serve_pprof(
  pprof,
  host = "localhost",
  port = proffer::random_port(),
  browse = interactive(),
  verbose = TRUE
)
}
\arguments{
\item{pprof}{Path to pprof samples.}

\item{host}{Host name. Set to \code{"localhost"} to view locally
or \code{"0.0.0.0"} to view from another machine. If you view
from another machine, the printed out URL will not be valid.
For example, if \code{pprof()} or \code{serve_pprof()} prints
"http://0.0.0.0:8080", then you need to replace 0.0.0.0
with your computer's name or IP address, e.g.
"http://my_computer.com:8080".}

\item{port}{Port number for hosting the local pprof server.
Chosen randomly by default.}

\item{browse}{Logical, whether to open a browser to view
the pprof server.}

\item{verbose}{Logical, whether to print console messages
such as the URL of the local \code{pprof} server.}
}
\value{
A \code{processx::process$new()} handle. Use this handle
to take down the server with \verb{$kill()}.
}
\description{
Visualize profiling data with pprof.
}
\details{
Uses a local interactive server.
Navigate a browser to a URL in the message.
The server starts in a background process
}
\examples{
if (identical(Sys.getenv("PROFFER_EXAMPLES"), "true")) {
pprof <- record_pprof(replicate(1e2, sample.int(1e4)))
# Start a pprof virtual server in the background.
px <- serve_pprof(pprof)
# Terminate the server.
px$kill()
}
}
