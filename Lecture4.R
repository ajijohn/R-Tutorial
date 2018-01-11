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

ggplot(data = surveysn, aes(x = species_id, y = weight)) +
  geom_boxplot()



# Plotting time series

yearly_counts <- surveysn %>%
  group_by(year, species_id) %>%
  tally()

#all combined
ggplot(data = yearly_counts, aes(x = year, y = n)) +
  geom_line()
#spread it out
ggplot(data = yearly_counts, aes(x = year, y = n, group = year)) +
  geom_line()

#color - use palette
ggplot(data = yearly_counts, aes(x = year, y = n,group = year,color=year)) +
  geom_line() + scale_color_gradient2()


#wesanderson color pkg


#facetting


yearly_sex_counts <- surveysn %>%
  group_by(year, species_id, sex) %>%
  tally()

ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id)


#apply

ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  theme_minimal()


#rotate right 90
ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) + theme(axis.text.x = element_text(angle=90))

yearly_sex_weight <- surveysn %>%
  group_by(year, sex, species_id) %>%
  summarize(avg_weight = mean(weight))

ggplot(data = yearly_sex_weight, aes(x = year, y = avg_weight, color = species_id)) +
  geom_line() +
  facet_grid(sex ~ .)

#by year/sex/species
ggplot(data = yearly_sex_weight, aes(x = year, y = avg_weight, color = species_id)) +
  geom_line() +
  facet_grid(. ~sex )

#changing font

ggplot(data = yearly_sex_weight, aes(x = year, y = avg_weight, color = species_id)) +
  geom_line() +
  theme_minimal(base_size = 14)
  facet_grid(sex ~ .)
  
  #labels
  ggplot(data = yearly_sex_weight, aes(x = year, y = avg_weight, color = species_id)) +
    geom_line() +
    theme_minimal(base_size = 14) +
    xlab("Average\nWeight")

  #interactive plots
  ggsave("my_viz.png")
