#1

library(dplyr)
library(ggplot2)
library(dslabs)
state <- reorder(state, rate)
str(state)
print(state)
levels(state)

#2
library(dplyr)
library(ggplot2)
library(dslabs)
data(us_contagious_diseases)
dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>% mutate(state=reorder(state,rate))
dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()

#3
library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
murders %>% mutate(rate = total/population*100000) %>%
  group_by(region) %>%
  summarize(avg = mean(rate)) %>%
  mutate(region = factor(region)) %>%
  ggplot(aes(region, avg)) +
  geom_bar(stat="identity") +
  ylab("Murder Rate Average")

#4
library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
str(murders)
murders %>% mutate(rate = total/population*100000) %>%
  mutate(region=reorder(region,rate, FUN = median)) %>%

  ggplot(aes(region, rate)) +
  geom_boxplot() +
  geom_point()