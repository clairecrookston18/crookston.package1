#'plot_locality_map

#'This function plots sample sites and population data onto a map to visualize population 
#'distributions of Gyrynophilus porphyriticus. I did not have enough time to add the degree minutes for higher resolution.

#' @param x name of tibble 'measurements' (tibble, no default)
#' @return map_plot1
 
plot_map <- function(x) {
  assert_that(is.data.frame(x))
  x = measurements
  pop_coords <- measurements %>% 
    select(population, long.deg, long.mins, lat.deg, lat.mins)
  pop_coords_complete <- na.rm(pop_coords)
  pop_coords_unique <- pop_coords_complete %>% 
    distinct(long.deg, lat.deg)
  pop_coords_unique_neg <- pop_coords_unique %>% 
    mutate(long.deg * (-1)) %>% 
    rename(long.deg.neg = 'long.deg * (-1)')
  library(sf)
  library(biogeo)
  library(mapview)
  library(rnaturalearth)
  library(rnaturalearthdata)
  library(rgeos)
  library(rnaturalearthhires)
  library(maps)
  library(tools)
  just_coords <- pop_coords_unique_neg %>% 
    select(long.deg.neg, lat.deg)
  just_coords_sf <- st_as_sf(just_coords, coords = c("long.deg.neg", "lat.deg"), crs = 4326, agr = "constant")
  E_US <- ne_states(country = 'united states of america', returnclass = "sf")
  map_plot1 <- ggplot(data = E_US) +
    geom_sf() +
    geom_sf(data = just_coords_sf, size = 4, shape = 23, fill = "darkred") +
    coord_sf(xlim = c(-84, -81), ylim = c(33, 36), expand = FALSE)
  assert_that(is.ggplot(map_plot1))
  return(map_plot1)
}

