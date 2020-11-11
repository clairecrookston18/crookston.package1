#'calculate mean head volume by population 

#'This function is starting small (really small) and will calculate the mean head volume 
#'for each population in the dataset 'measurements'. The input is the name of the dataset.
#'The output is an object with the Population and its associated mean head volume (mm).
#'
#' @param x name of tibble 'measurements' (tibble, no default)  
#' @return Pop_mean_vol which contains Population IDs and associated mean head volume (data frame).

mean_pop_head_vol <- function(x) {
  assert_that(is.data.frame(x))
  x = measurements
  Head_vol <- measurements %>% 
    select(population, HdLngth, HdWdth, HdDpth) %>% 
    group_by(population)
  Calc_Head_vol <- Head_vol %>% 
    mutate(HdLngth * HdWdth * HdDpth) %>% 
    rename(HdVol = 'HdLngth * HdWdth * HdDpth')
  Calc_mean_vol <- aggregate(Calc_Head_vol$HdVol, by = list(Calc_Head_vol$population), FUN = mean)
  Pop_mean_vol <- Calc_mean_vol %>% 
    rename(Population = 'Group.1', MeanVol = 'x')

  assert_that(is.data.frame(Pop_mean_vol))
  return(Pop_mean_vol)
  
}
