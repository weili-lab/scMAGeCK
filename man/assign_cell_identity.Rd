\name{assign_cell_identity}
\alias{assign_cell_identity}
\title{
Assign single cell identity to genes to be perturbed. 
}
\description{
assign the identity of single cells, by adding a gene column to the metadata.
}
\usage{
assign_cell_identity(BARCODE, RDS, ASSIGNMETHOD='unique') 
}
\arguments{
  \item{BARCODE}{
A txt file to include cell identity information, generated from the cell 
identity collection step; or a corresponding data.frame.
}
  \item{RDS}{
RDS object from the pre-processRDS step; or a path to RDS file.
}
  \item{ASSIGNMETHOD}{
Determine the way to assign cell identity. "unique" only assigns single cells that only have 1 guide 
detected (others are labeled as NA or doublet).  
"largest" will assign single cells with the largest umi count.
}
}
\value{
  The input Seurat object with per-cell identity added to its metadata:
  \code{gene}, \code{sgrna} and \code{umi_count} columns (cells with
  multiple guides are labeled \code{"doublet"} under the \code{"unique"} method).
}
\examples{
    
    ### Loading required package
    require(Seurat)
    
    ### BARCODE file contains cell identity information, generated from the cell identity collection step
    BARCODE <- system.file("extdata","barcode_rec.txt",package = "scMAGeCK")
    
    ### RDS can be a Seurat object or local RDS file path that contains the scRNA-seq dataset
    RDS <- system.file("extdata","singles_dox_mki67_v3.RDS",package = "scMAGeCK")
    
    ### For using the featurePlot function, it needs to do the preprocessRDS first
    RDS <- assign_cell_identity(BARCODE, RDS)


    
}
