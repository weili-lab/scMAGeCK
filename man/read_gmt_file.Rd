\name{read_gmt_file}
\alias{read_gmt_file}
\title{
Read a gene set file in GMT format.
}
\description{
Read a gene set file in the Broad Institute GMT format, where each line
describes one gene set (name, description, followed by its member genes,
tab-separated), and return it as a data frame.
}
\usage{
read_gmt_file(gmt_path)
}
\arguments{
  \item{gmt_path}{
Path to a gene set file in GMT format.
}
}
\value{
  A data frame with one row per gene set; the first column is the gene set
  name and the remaining columns are its member genes (padded with empty
  strings for sets with fewer genes).
}
\examples{
    gmt <- system.file("extdata", "test_symbols.gmt.txt", package = "scMAGeCK")
    gene_sets <- read_gmt_file(gmt)
}
