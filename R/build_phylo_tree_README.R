#'build_phylogenetic_tree

#'This function takes the available trait and distribution data to create 
#'phylogentic topologies. (Not sure if this could be done with what I have, but 
#'it is worth a shot. Perhaps I can do this and/or get tree data from 
#'Open Tree of Life [rotl] and do some playing around).

#' @param x name of list 'taxa' (chr [1:6], no default)
#' @return plot_sala_tree the phylogeny built from the 6 genera
#' @importFrom rotl tnrs_match_names
#' @importFrom rotl tol_induced_subtree
#' @importFrom assertthat assert_that
#' @export 

build_phylo <- function(x)  {
  assertthat::assert_that(is.vector(taxa))
  x = taxa
  taxa <- c("Gyrinophilus", "Eurycea", "Desmognathus", "Plethodon", "Hemidactylium", "Bolitoglossa")
  resolved_names <- tnrs_match_names(taxa)
  my_sala_tree <- tol_induced_subtree(ott_ids = resolved_names$ott_id)
  plot_sala_tree <- plot(my_sala_tree)
  if (!inherits(my_sala_tree, "phylo")){
    stop("tree must be of class 'phylo'")}
  return(plot_sala_tree)
}