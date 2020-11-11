#' Calculate volume of shrub
#' 
#' @param length length of the shrub (numeric, default 1)
#' @param width width of shrub (numeric, default 1)
#' @param height height of shrub (numeric, default 1)
#' @return volume of shrub (numeric)
#' 
#' @examples
#' calc_shrub_vol(2, 3, 2)
#' calc_shrub_vol(length = 2, width = 3, height = 2)


calc_shrub_vol <- function(length = 1, width = 1, height = 1) {
  volume <- length * width * height
  return(volume)
}

#'Calculate mass of shrub
#'
#'@param volume (numeric)
#'@return mass of shrub (numeric)


calc_shrub_mass <- function(volume){
  mass <- 2.65 * volume^0.9
  return(mass)
}

#' Calculate density of shrub 
#'
#'@param width width of shrub (numeric, default 2)
#'@param length length of shrub (numeric, default 4)
#'@param height height of shrub (numeric, default 1)
#'@return density of shrub (numeric)
#'



calc_shrub_density <- function(width = 2, length = 4, height = 1) {
  volume = calc_shrub_vol(length, width, height)
  mass = est_shrub_mass(volume)
  density = mass / volume
  return(density)
  }