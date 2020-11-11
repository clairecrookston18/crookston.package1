#'Calculates the area of a square
#'
#'@param side_length length of a side of a square
#'@return area_of_square 
#'
#'@export
#'

square_calc <- function(side_length){
  assert_that(is.numeric(side_length)) ##pre-condition: checking input
  area <- side_length^2
  assert_that(sqrt(area) == side_length) ##post condition:making sure calculation was carried out correctly
  return(area)
}

##pre-condition and post condition are testing!