\name{guidematrix_to_triplet}
\alias{guidematrix_to_triplet}
\title{
Convert guide matrix into a dataframe containing cell, barcode, read and UMI count.
}
\description{
Convert guide matrix into a dataframe, where columns include cell, barcode, 
read count and UMI count.
}
\usage{
guidematrix_to_triplet(count_mat, RDS) 
}
\arguments{
  \item{count_mat}{
A guide count matrix where columns are cell names and rows are guide names
} 
  \item{RDS}{
A Seurat object or local RDS file path that contains the scRNA-seq dataset. 
Note that the dataset has to be normalized and scaled.
}
}
\value{
  A data frame that contains cell names, guide names, read count and UMI count as column.
}
\examples{
    ### a guide-by-cell count matrix; column names must be cell names in the Seurat object
    RDS <- system.file("extdata", "singles_dox_mki67_v3.RDS", package = "scMAGeCK")
    obj <- readRDS(RDS)
    cells <- head(colnames(obj), 4)
    count_mat <- matrix(c(3, 0, 2, 0,
                          0, 5, 0, 1),
                        nrow = 2, byrow = TRUE,
                        dimnames = list(c("sgRNA_A", "sgRNA_B"), cells))
    triplets <- guidematrix_to_triplet(count_mat, obj)
    head(triplets)
}
