\name{scmageck_rra}
\alias{scmageck_rra}
\title{
Use RRA to test the association of gene knockout with certain marker expression
}
\description{
Use Robust Rank Aggregation (RRA) to test whether perturbing a gene is
associated with the expression of a given marker gene or gene signature.
}
\usage{
scmageck_rra(BARCODE, RDS, GENE, RRAPATH = NULL, LABEL = NULL, NEGCTRL = NULL, 
SIGNATURE = NULL, KEEPTMP = FALSE, PATHWAY = FALSE, SAVEPATH = "./",ASSIGNMETHOD = "largest",SLOT='scale.data')
}
\arguments{
  \item{BARCODE}{
A txt file to include cell identity information, generated from the cell 
identity collection step; or a corresponding data.frame.
}
  \item{RDS}{
A Seurat object or local RDS file path that contains the scRNA-seq dataset; 
or a path to RDS file.
Note that the dataset has to be normalized and scaled. 
}
  \item{GENE}{
Genes whose expressions are to be tested. Multiple genes can be provided, 
separated by ",". For example, "MKI67,TP53"
}
  \item{RRAPATH}{
Deprecated and retained only for backward compatibility. Since version 1.5.1
the RRA algorithm is built into the package through Rcpp, so no external
executable is needed. A path supplied here that does not exist on disk is
ignored and the built-in implementation is used.
}
  \item{LABEL}{
The label of the output file.
}
  \item{NEGCTRL}{
The name of the negative control gene. For example, "NonTargetingControlGuideForHuman". 
Default is NULL (do not use any negative controls).
}
  \item{KEEPTMP}{
Keep temporary files.
}
  \item{PATHWAY}{
Treat genes in --GENE option as a pathway. In other words, the averaged 
expression of these genes will be used for testing.
}
  \item{SAVEPATH}{
The save path of result. Default save path is the current working directory. 
If you don't need save the result, set SAVEPATH as NULL.
}
  \item{ASSIGNMETHOD}{
Method used to assign the sgRNA identity to each cell. Can be either unique or largest. 
See assign_cell_identity for more details.
}
  \item{SIGNATURE}{
A GMT text file. The format must be as follows: (1) Column 1: name of gene set;
(2) Column 2: empty, or information about the gene set, e.g. its source;
(3) Column 3 and onwards: ids of genes belonging to a particular gene set. 
Note that if you don't set the parameter "SAVEPATH", this parameter would create a 
folder called "GENE_SET"" in the current working directory to store the results from 
applying RRA program to do gene set analysis.
Reference: http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats
}
 \item{SLOT}{
Use the slot in Seurat object for plot. May choose 'data', 'scale.data' or 'counts'. See GetAssayData function in Seurat.
}
}
\value{
A data frame of RRA results.
}
\examples{
    ### BARCODE file contains cell identity information, generated from the cell identity collection step
    BARCODE <- system.file("extdata","barcode_rec.txt",package = "scMAGeCK")
    
    ### RDS can be a Seurat object or local RDS file path that contains the scRNA-seq dataset
    RDS <- system.file("extdata","singles_dox_mki67_v3.RDS",package = "scMAGeCK")

    target_gene <- "MKI67"
    rra_result <- scmageck_rra(BARCODE=BARCODE, RDS=RDS, GENE=target_gene,
                               LABEL='dox_mki67', NEGCTRL=NULL, KEEPTMP=FALSE,
                               SIGNATURE=NULL, PATHWAY=FALSE, SAVEPATH=NULL)
    head(rra_result)
}

