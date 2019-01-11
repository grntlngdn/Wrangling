library(tidyverse)
#Change path based on package and enter csv name on line 4
path <- system.file("extdata", package="dslabs")
filename <- file.path(path,  "fertility-two-countries-example.csv")
dest_file <- "data/fertility.csv"

data <- read_csv(filename)

# copy CSV to be part of this directory/repository
write.csv(data, file = dest_file, row.names=FALSE)

