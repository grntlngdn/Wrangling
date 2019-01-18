library(tidyverse)
#Change path based on package and enter csv name on line 4
path = system.file("extdata", package="dslabs")
filename = file.path(path,  "RD-Mortality-Report_2015-18-180531.pdf")
dest_file = "data/mortality.pdf"

file.copy(filename, dest_file)

system("cmd.exe", input = paste("start", dest_file))