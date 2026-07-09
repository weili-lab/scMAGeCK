# scMAGeCK 0.99.0

* Full compatibility with Seurat v5 / SeuratObject >= 5.
  - Seurat objects are updated with `UpdateSeuratObject()` on read, so
    objects saved by older Seurat versions no longer error with
    `no slot of name "images"`.
  - Replaced the defunct `slot=` argument of `GetAssayData()` and
    `FetchData()` with `layer=` (defunct in SeuratObject >= 5.4).
  - The bundled example object is now stored in the Seurat v5 format.
* `DESCRIPTION` now requires `Seurat (>= 5.0.0)`.
* Compiled code (RRA) now writes diagnostics to the R console via
  `Rcpp::Rcout`/`Rcpp::Rcerr`/`Rprintf` instead of `std::cout`/`printf`.
* R CMD check / BiocCheck clean-up (dead code, namespace, docs, examples).
* Version reset to 0.99.0 for Bioconductor resubmission.
