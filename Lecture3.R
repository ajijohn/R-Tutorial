## Compare the difference between when the data are being read as
## `factor`, and when they are being read as `character`.
surveys <- read.csv("https://ndownloader.figshare.com/files/2292169", stringsAsFactors = TRUE,header = TRUE)str(surveys)
str(surveys)
## Convert the column "plot_type" into a factor
surveys$plot_type <- factor(surveys$plot_type)
animal_data <- data.frame(animal = c("dog", "cat", "sea cucumber", "sea urchin"),
                          feel = c("furry","furry", "squishy", "spiny"),
                          weight = c(45, 8, 1.1, 0.8))


country_climate <- data.frame(
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, "15"),
  northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
  has_kangaroo = c(FALSE, FALSE, FALSE, 1)
)

#convert data frames

library(lubridate)
