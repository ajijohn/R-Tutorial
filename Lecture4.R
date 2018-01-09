#introduction to tidyverse

#dplyr tutorial
#tidyr

#talk about cheartsheets
#talk about global options


#talk about tidyverse

library(tidyverse)

surveysn <- read_csv("https://ndownloader.figshare.com/files/2292169")
str(surveysn)

#one way
surveysn %>% select(plot_id,species_id,weight)

#another way
select(surveysn,plot_id,species_id,weight)