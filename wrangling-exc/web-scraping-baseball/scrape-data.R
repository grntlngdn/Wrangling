library(rvest)

url = "http://www.stevetheump.com/Payrolls.htm"
dest_file = "data/payroll.htm"

payroll = read_html(url) %>%
  html_nodes("table") %>%
  .[[10]]
payroll

#need to extract year from each tables title.
#In the wrangling, this can be added as a variable and each teams payroll for each year can then be combined with row-binds.
#as pointed out in quesitons string processing will have to be used to substitute standard team names first

write_xml(payroll, file = dest_file)
browseURL(dest_file)

