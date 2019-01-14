library(tidyverse)
#Change path based on package and enter csv name on line 4
path = system.file("extdata", package="dslabs")
filename = file.path(path,  ".csv")
dest_file = "data/payroll.csv"

file.copy(filename, dest_file)
read_lines(dest_file, n_max = 5)