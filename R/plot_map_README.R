#'plot_map

#'This function plots sample sites and population data onto a map to visualize population 
#'distributions of Gyrynophilus porphyriticus.

#' @param x name of tibble 'measurements' (tibble, no default)
#' @return map_plot1 the plot of the map with populations as red diamonds
#' @importFrom ggplot2 geom_sf
#' @importFrom ggplot2 coord_sf
#' @importFrom magrittr %>%  
#' @importFrom na.tools na.rm
#' @importFrom sf st_as_sf
#' @importFrom rnaturalearth ne_states
#' @importFrom assertthat assert_that
#' @export
 
plot_map <- function(x) {
  assertthat::assert_that(is.data.frame(x))
  x = measurements
  pop_coords <- measurements %>% 
    select(population, long.deg, long.mins, lat.deg, lat.mins)
  pop_coords_complete <- na.rm(pop_coords)
  pop_coords_unique <- pop_coords_complete %>% 
    distinct(population, long.deg, long.mins, lat.deg, lat.mins)
  pop_coords_unique_neg <- pop_coords_unique %>% 
    mutate(long.deg * (-1)) %>% 
    rename(long.deg.neg = 'long.deg * (-1)')
  pop_coords_dec <- pop_coords_unique_neg %>% 
    mutate(long.dec = long.mins/60) %>% 
    mutate(lat.dec = lat.mins/60)
  pop_coords_neg2 <- pop_coords_dec %>% 
    mutate(long.dec * (-1)) %>% 
    rename(long.dec.neg = 'long.dec * (-1)')
  pop_coords_new <- pop_coords_neg2 %>% 
    select(population, long.deg.neg, long.dec.neg, lat.deg, lat.dec)
  pop_coords_new_comb <- pop_coords_new %>% 
    mutate(longitude = rowSums(.[2:3])) %>%  
    mutate(latitude = rowSums(.[4:5]))
  just_coords_new <- pop_coords_new_comb %>% 
    select(longitude, latitude)
  
  library(sf)
  library(biogeo)
  library(mapview)
  library(rnaturalearth)
  library(rnaturalearthdata)
  library(rgeos)
  library(rnaturalearthhires)
  library(maps)
  library(tools)
  just_coords_new_sf <- st_as_sf(just_coords_new, coords = c("longitude", "latitude"), crs = 4326, agr = "constant")
  E_US <- ne_states(country = 'united states of america', returnclass = "sf")
  map_plot1 <- ggplot(data = E_US) +
    geom_sf() +
    geom_sf(data = just_coords_new_sf, size = 4, shape = 23, fill = "darkred") +
    coord_sf(xlim = c(-84, -82), ylim = c(34, 36), expand = FALSE)
  assertthat::assert_that(is.ggplot(map_plot1))
  return(map_plot1)
}

