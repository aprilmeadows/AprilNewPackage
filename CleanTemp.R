library(tidyverse)

# Read in the data.  Do some cleaning/verification
MaxTemp <- read.csv('data-raw/FlagMaxTemp.csv') %>%
  gather('DOM', 'MaxTemp', X1:X31) %>%
  drop_na() %>%
  mutate(DOM  = str_remove(DOM, fixed('X')) ) %>%
  mutate(Date = lubridate::ymd( paste( Year, Month, DOM )) ) %>%
  select(Date, MaxTemp)

# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(MaxTemp)



#' A time series of daily maximum temperatures in Flagstaff, AZ.
#'
#' @format a data frame with 10882 observations
#' \describe{
#'   \item{Date}{The date of observation as a POSIX date format.}
#'   \item{MaxTemp}{Daily maximum temperature in degrees Farhenheit.}
#' }
#' @source \url{www.ncdc.noaa.gov}
"MaxTemp"
