# Internal helpers and global-variable declarations.

# Capitalize the first letter of each string (mouse gene-symbol style),
# e.g. "tp53" -> "Tp53". Replaces the previously undeclared capitalize().
capitalize <- function(x) {
    substr(x, 1, 1) <- toupper(substr(x, 1, 1))
    x
}

# Column names used in non-standard evaluation (ggplot2 aes(), subset(),
# with(), etc.) and default-argument placeholders.
utils::globalVariables(c(
    "Expression", "FDR", "Type", "UMAP_1", "UMAP_2", "cell", "cor_ctrl",
    "cor_target", "gene", "genes", "index", "label", "level", "markers",
    "ncell", "nscore", "number_gRNA", "p.high", "p.low", "padj",
    "plot.type", "pscore", "sel_score1", "sel_score2", "select.type",
    "seurat_clusters", "sgRNA", "targetobj"
))
