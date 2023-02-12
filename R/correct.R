# 1. Load files =================================================================
reg_nats3857 <- sf::st_read("reg_nat_3857.geojson")
reg_nats <- sf::st_read("data/reg_nat.shp")
reg_nat_non_delim <- sf::st_read("data/reg_nat_non_delim.geojson")


# 2. correct this error
reg_nats3857$reg_nat[reg_nats3857$reg_nat == "Préalpes de Dignes"] <- "Préalpes de Digne"

# 3 re write everything
sf::st_write(reg_nats3857, "data/reg_nat_3857.geojson") 
sf::st_write(sf::st_transform(reg_nats3857, 4326), "data/reg_nat_4326.geojson")
sf::st_write(sf::st_transform(reg_nats3857, 2154), "data/reg_nat_2154.gpkg")
sf::st_write(sf::st_transform(reg_nats3857, 2154), "data/reg_nat.shp", delete_dsn = TRUE)
