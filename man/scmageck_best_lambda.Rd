\name{scmageck_best_lambda}
\alias{scmageck_best_lambda}
\title{
Find the best lambda using negative controls
}
\description{
This function identifies the best value for lambda, a tuning parameter used in a modeling approach that uses negative controls. Negative controls are samples or features that should not have any meaningful association with the outcome of interest. This approach can be useful in situations where there may be confounding factors or batch effects that can affect the results of a model.
}
\usage{
scmageck_best_lambda(
  rds_object,
  bc_frame,
  non_target_ctrl = "NT",
  lambda_seq = 10^seq(-3, 3, length = 10),
  pseudogene_label = "PSEUDO_GENE",
  pseudogene_num = 250
)
}
\arguments{
  \item{rds_object}{
  Seurat object or local RDS file path that contains the scRNA-seq dataset. Alternatively, you can provide the path to an RDS file. The dataset should only contain cells expressing non-targeting gRNA, which will be used as negative controls for lambda tuning.
  }
  \item{bc_frame}{
  A txt file or corresponding data.frame that includes cell identity information generated from the cell identity collection step. The bc_frame should have the same number of rows as the rds_object input, and each row should contain a unique cell barcode or identifier along with its corresponding cell identity.
  }
  \item{non_target_ctrl}{
  A character vector or string containing a comma-separated list of genes that serve as negative controls.
  }
  \item{lambda_seq}{
  A sequence of lambda values to test. Defaults to 10^seq(-3, 3, length = 10).
  }
  \item{pseudogene_label}{
  A character string to be used as a pseudogene to evaluate the false positive rate. The defalut value for pseudogene_label is PSEUDO_GENE.
  }
  \item{pseudogene_num}{
  An integer value indicating the number of cells that should be selected as pseudogenes for false positive rate evaluation. The default value for pseudogene_num is 250.
  }
}
\value{
The output of the function is a data frame containing the lambda value and the corresponding false positive rate on the negative control samples. Additionally, the function generates a plot showing the relationship between lambda and the false positive rate.
}
\seealso{
\code{\link{scmageck_eff_estimate}} \href{https://bitbucket.org/weililab/scmageck/src/master/}{scMAGeCK BitBucket}
}
\examples{
    RDS <- system.file("extdata", "singles_dox_mki67_v3.RDS", package = "scMAGeCK")
    BARCODE <- system.file("extdata", "barcode_rec.txt", package = "scMAGeCK")
    lambda_seq <- 10^seq(-2, 2, length = 5)

    # the cross-validation over lambda is time consuming
    \donttest{
      obj <- assign_cell_identity(BARCODE, readRDS(RDS))
      bc_frame <- read.table(BARCODE, header = TRUE, as.is = TRUE)
      lambda_df <- scmageck_best_lambda(obj, bc_frame,
                        non_target_ctrl = "NonTargetingControlGuideForHuman",
                        lambda_seq = lambda_seq, pseudogene_num = 100)
    }
}
