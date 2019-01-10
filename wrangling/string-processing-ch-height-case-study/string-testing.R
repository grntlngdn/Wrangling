library(tidyverse)
library(stringr)
library(dslabs)
data(reported_heights)

filename = "data/heights.csv"
dest_file = "rdas/heights.rda"
heights = reported_heights %>%
  mutate(new_height = as.numeric(height)) %>%
  filter(is.na(new_height))

not_inches = function(x, smallest = 50, tallest = 84){
  inches = suppressWarnings(as.numeric(x))
  ind = is.na(inches) | inches < smallest | inches > tallest
  ind
}

not_inches_or_cm = function(x, smallest = 50, tallest = 84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- !is.na(inches) & 
    ((inches >= smallest & inches <= tallest) |
       (inches/2.54 >= smallest & inches/2.54 <= tallest))
  !ind
}
  
convert_format = function(s){
  s %>%
    str_replace("feet|foot|ft", "'") %>% #convert feet symbols to '
    str_replace_all("inches|in|''|\"|cm|and", "") %>%  #remove inches and other symbols
    str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2") %>% #change x.y, x,y x y
    str_replace("^([56])'?$", "\\1'0") %>% #add 0 when to 5 or 6
    str_replace("^([12])\\s*,\\s*(\\d*)$", "\\1\\.\\2") %>% #change european decimal
    str_trim() #remove extra space
}

words_to_numbers = function(s){
  str_to_lower(s) %>%  
    str_replace_all("zero", "0") %>%
    str_replace_all("one", "1") %>%
    str_replace_all("two", "2") %>%
    str_replace_all("three", "3") %>%
    str_replace_all("four", "4") %>%
    str_replace_all("five", "5") %>%
    str_replace_all("six", "6") %>%
    str_replace_all("seven", "7") %>%
    str_replace_all("eight", "8") %>%
    str_replace_all("nine", "9") %>%
    str_replace_all("ten", "10") %>%
    str_replace_all("eleven", "11")
}

problems = reported_heights %>% 
  filter(not_inches_or_cm(height)) %>%
  .$height
#length(problems)

converted = problems %>%
  words_to_numbers %>%
  convert_format

remaining_problems = converted[not_inches_or_cm(converted)]

# problems = reported_heights %>% 
#   filter(not_inches(height)) %>%
#   .$height %>% 
#   str_replace("feet|ft|foot", "'") %>% # replace feet, ft, foot with ' 
#   str_replace("inches|in|''|\"", "") # remove all inches symbols

pattern = "^[4-7]\\s*'\\s*(\\d+\\.?\\d*)$"
#pattern_with_groups = "^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$"

str_subset(problems, pattern_with_groups) %>%
  str_replace(pattern_with_groups, "\\1'\\2") %>%
  head

sum(str_detect(problems, pattern))

#index = str_detect(converted, pattern)
index = str_detect(remaining_problems, pattern)
mean(index)

#converted[!index]
remaining_problems[!index]

#problems[c(2, 10, 11, 12, 15)] %>% str_view(pattern)
converted[c(2, 10, 11, 12, 15)] %>% str_view(pattern)

#head(heights)
save(heights, file = dest_file)