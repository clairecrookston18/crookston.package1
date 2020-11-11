#'plot_locality_map

#'This function plots sample sites and population data onto a map to visualize population 
#'distributions of Gyrynophilus porphyriticus.





plot_map <- function(x) {
  x = measurements
  pop_coords <- measurements %>% 
    select(population, long.deg, long.mins, lat.deg, lat.mins)
  
  
  
}

