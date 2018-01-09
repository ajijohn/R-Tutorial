## Compare the difference between when the data are being read as
## `factor`, and when they are being read as `character`.
surveys <- read.csv("https://ndownloader.figshare.com/files/2292169", stringsAsFactors = TRUE,header = TRUE)str(surveys)
str(surveys)
## Convert the column "plot_type" into a factor
surveys$plot_type <- factor(surveys$plot_type)
animal_data <- data.frame(animal = c("dog", "cat", "sea cucumber", "sea urchin"),
                          feel = c("furry","furry", "squishy", "spiny"),
                          weight = c(45, 8, 1.1, 0.8))


country_climate <- data.frame(stringsAsFactors = FALSE,
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, "15"),
  northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
  has_kangaroo = c(FALSE, FALSE, FALSE, 1)
)

#Mention automatic coercion 
#redo the data.frame


#convert data frames

library(lubridate)

#base date masked

# if need to use , do base::date

my_date <- ymd("2015-01-01")
str(my_date)

my_date <- ymd(paste("2015", "1", "1", sep = "-"))
str(my_date)



ymd("2015-02-30") # No warning, even though quiet is TRUE
?ymd # Note that the default value of quiet is TRUE, which should return a warning if a date failed to parse



paste(surveys$year, surveys$month, surveys$day, sep = "-")

# talk about repeitition


ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
str(surveys) # notice the new column, with 'date' as the class



summary(surveys$date)
is.na(surveys$date)



#filter dates

survey_g <- surveys[!is.na(surveys$date),]
newfilter<- surveys[complete.cases(surveys),]


plot(x=surveys$date,y=surveys$weight,data=surveys)


