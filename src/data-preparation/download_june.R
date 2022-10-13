
# download datasets -------------------------------------------------------

  #calender dataset download
  options(timeout = 200) #extending download timeout because default is 60sec
  download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/calendar.csv.gz', destfile = 'data/calendar/calendar-8-jun.csv')
  #load dataset into variables
  calendar_j <-read.csv("data/calendar/calendar-8-jun.csv")


  #listings dataset download
  download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/listings.csv.gz', destfile = 'data/listings/listings-8-jun.csv')
  #load dataset into variables
  june <- read.csv("data/listings/listings-8-jun.csv")


# save datasets -----------------------------------------------------------

  #saving june and calendar data
  save(calendar_j,file="gen/data-preparation/temp/calendar_j.RData")
  save(june,file="gen/data-preparation/temp/june.RData")
