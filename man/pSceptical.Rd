% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pSceptical.R
\name{pSceptical}
\alias{pSceptical}
\alias{zSceptical}
\title{Computes the sceptical p-value and z-value}
\usage{
pSceptical(
  zo,
  zr,
  c,
  alternative = c("one.sided", "two.sided"),
  type = c("golden", "nominal", "liberal", "controlled")
)

zSceptical(zo, zr, c)
}
\arguments{
\item{zo}{Numeric vector of z-values from original studies.}

\item{zr}{Numeric vector of z-values from replication studies.}

\item{c}{Numeric vector of variance ratios of the original and replication
effect estimates. This is usually the ratio of the sample
size of the replication study to the sample size of the
original study.}

\item{alternative}{Either "one.sided" (default) or "two.sided".
If "one.sided", the sceptical p-value is based on a one-sided
assessment of replication success in the direction of the original effect estimate.
If "two.sided", the sceptical p-value is based on a two-sided
assessment of replication success regardless of the direction of the
original and replication effect estimate.}

\item{type}{Type of recalibration. Can be either "golden" (default), "nominal",
"liberal", or "controlled". Setting \code{type} to "nominal" corresponds to no
recalibration as in Held et al. (2020). A recalibration is applied if
\code{type} is "liberal", "controlled", or "golden", and the sceptical p-value
can then be interpreted on the same scale as an ordinary p-value (e.g., a one-sided
sceptical p-value can be thresholded at the conventional 0.025 level).
See \code{\link{levelSceptical}} for details about recalibration types.}
}
\value{
\code{pSceptical} returns the sceptical p-value.

\code{zSceptical} returns the z-value of the sceptical p-value.
}
\description{
Computes sceptical p-values and z-values based on the z-values of the
original and the replication study and the corresponding variance ratio.
If specified, the p-values are recalibrated.
}
\details{
\code{pSceptical} is the vectorized version of \code{.pSceptical_}.
\code{\link[base]{Vectorize}} is used to vectorize the function.
}
\examples{
## no recalibration (type = "nominal") as in Held (2020)
pSceptical(zo = p2z(0.01), zr = p2z(0.02), c = 2, alternative = "one.sided",
           type = "nominal")

## recalibration with golden level as in Held, Micheloud, Pawel (2020)
pSceptical(zo = p2z(0.01), zr = p2z(0.02), c = 2, alternative = "one.sided",
           type = "golden")

## two-sided p-values 0.01 and 0.02, relative sample size 2
pSceptical(zo = p2z(0.01), zr = p2z(0.02), c = 2, alternative = "one.sided")
## reverse the studies
pSceptical(zo = p2z(0.02), zr = p2z(0.01), c = 1/2, alternative = "one.sided")
## both p-values 0.01, relative sample size 2
pSceptical(zo = p2z(0.01), zr = p2z(0.01), c = 2, alternative = "two.sided")

zSceptical(zo = 2, zr = 3, c = 2)
zSceptical(zo = 3, zr = 2, c = 2)
}
\references{
Held, L. (2020). A new standard for the analysis and design of replication
studies (with discussion). \emph{Journal of the Royal Statistical Society:
Series A (Statistics in Society)}, \bold{183}, 431-448.
\doi{10.1111/rssa.12493}

Held, L., Micheloud, C., Pawel, S. (2021). The assessment of replication success
based on relative effect size. \url{https://arxiv.org/abs/2009.07782}
}
\seealso{
\code{\link{sampleSizeReplicationSuccess}}, \code{\link{powerReplicationSuccess}}, \code{\link{levelSceptical}}
}
\author{
Leonhard Held
}
