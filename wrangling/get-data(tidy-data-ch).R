#library(dslabs)

path <- system.file("extdata", package="dslabs")
filename <- file.path(path,  "fertility-two-countries-example.csv")
data <- read_csv(filename)
dest_file <- "data/fertility.csv"

# copy CSV to be part of this directory/repository
write.csv(data, file = dest_file, row.names=FALSE)

# #I haven't quite figured out how to get file.copy working details are at https://stackoverflow.com/questions/2384517/using-r-to-copy-files
# flist <- list.files(path, "fertility-two-countries-example.+[.]csv$", full.names = TRUE)
# file.copy(flist, file = "data")

