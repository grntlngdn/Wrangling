library(tidyverse)
#Change path based on package and enter csv name on line 4
path = system.file("extdata", package="dslabs")
files <- list.files(path)
files
# #should code this to automatically only include .csv
# for (file in files[1:4]) {
#   read_csv(file.path(path, file))
# }
 filename = file.path(path,  "olive.csv")
 dest_file = "data/olive.csv"
 
 file.copy(filename, dest_file)
 read_lines(dest_file, n_max = 5)