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


surveysn %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))



surveysn %>%
  group_by(plot_id) %>%
  summarize(mean_weight = n())



surveys_gw <- surveysn %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>%
  summarize(mean_weight = mean(weight))

str(surveys_gw)

#introduce reshaping

#wide table
surveys_spread <- surveys_gw %>%
  spread(key = genus, value = mean_weight)


#wide to long
surveys_gather <- surveys_spread %>%
  gather(key = genus, value = mean_weight, -plot_id)


#specific selectopn

surveys_spread %>%
  gather(key = genus, value = mean_weight, -c('plot_id','Baiomys','Spermophilus')) %>%
  head


