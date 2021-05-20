library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
str(gapminder)


#1
library(ggplot2)
library(dslabs)
data(gapminder)
## fill out the missing parts in filter and aes
gapminder %>% filter(continent == "Africa" & year == "2012") %>%
  
  ggplot(aes(fertility, life_expectancy)) +
  geom_point()

#2
library(ggplot2)
library(dslabs)
data(gapminder)
## add color by region
gapminder %>% filter(continent == "Africa" & year == "2012") %>%
  
  ggplot(aes(fertility, life_expectancy, color = region)) +
  geom_point()

#3
## Create a table showing the country and region for the African countries (use select) that in 2012 had fertility rates of 3 or less and life expectancies of at least 70
library(ggplot2)
library(dslabs)
data(gapminder)
## create df, add filters & select columns
df <- gapminder %>% filter(continent == "Africa" & year == "2012" & fertility <= 3 & life_expectancy >= 70) %>%
  select(country, region)
df

#4
library(dplyr)
library(dslabs)
data(gapminder)
#filter yrs 1960 to 2010 & Vietnam and the US
tab <-gapminder %>% filter(between(year, 1960, 2010), country %in% c("United States", "Vietnam"))

#5
#geom_line plot
p <- tab %>%
  ggplot(aes(year, life_expectancy, group = country, color = country)) +
  geom_line()
p

#6
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% filter(between(year, 1960, 2010), country == "Cambodia") %>% ggplot(aes(year, life_expectancy)) + geom_line()

#7
library(dplyr)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>% filter(continent == "Africa" & year == 2010 & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)

#8
daydollars %>% ggplot(aes(dollars_per_day)) +
  geom_density() +
  scale_x_continuous(trans = "log2")

#9
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>% filter(continent == "Africa" & year %in% c(1970, 2010) & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)
daydollars %>% ggplot(aes(dollars_per_day)) +
  geom_density() +
  scale_x_continuous(trans = "log2") +
  facet_grid(. ~ year)

#10
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>% filter(continent == "Africa" & year %in% c(1970, 2010) & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)
daydollars %>% ggplot(aes(dollars_per_day, fill = region)) +
  scale_x_continuous(trans = "log2") +

geom_density(alpha = 0.2, bw = 0.5, position = "stack") +
  facet_grid(year ~ .)

#11
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
# create the mutated dataset
gapminder_Africa_2010 <- gapminder %>% filter(continent == "Africa" & year == 2010 & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)
# now make the scatter plot
gapminder_Africa_2010 %>% ggplot(aes(dollars_per_day, infant_mortality, color = region)) +
geom_point()

#12
# your plotting code here
gapminder_Africa_2010 %>% ggplot(aes(dollars_per_day, infant_mortality, color = region)) +
  scale_x_continuous(trans = "log2") +
  geom_point()

#13
# your plotting code here
gapminder_Africa_2010 %>% ggplot(aes(dollars_per_day, infant_mortality, label = country, color = region)) +
  scale_x_continuous(trans = "log2") +
  geom_point() +
  geom_text(data = gapminder_Africa_2010, size = 3)

#14
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder_Africa <- gapminder %>% filter(continent == "Africa" & year %in% c(1970, 2010)  & !is.na(gdp) & !is.na(infant_mortality)) %>%
  mutate(dollars_per_day = gdp/population/365)
gapminder_Africa

gapminder_Africa %>% ggplot(aes(dollars_per_day, infant_mortality, label = country, color = region)) +
  scale_x_continuous(trans = "log2") +
  geom_point() +
  geom_text(data = gapminder_Africa, size = 3) +
  facet_grid(year ~ .)
