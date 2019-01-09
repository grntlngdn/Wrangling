library(tidyverse)
#Change path based on package and enter csv name on line 4
path <- system.file("extdata", package="dslabs")
filename <- file.path(path,  "life-expectancy-and-fertility-two-countries-example.csv")
dest_file <- "data/fertility_vs_life_expectancy.csv"

file.copy(filename, dest_file)

