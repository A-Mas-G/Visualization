library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

#1
str(temp_carbon)
head(temp_carbon)

temp_carbon %>%
  .$year %>%
  max() #2018

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  pull(year) %>%
  max() #2014

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  max(year) #error
  
temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  .$year %>%
  max() #2014

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  select(year) %>%
  max() #2014

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  max(.$year) #NA

#2
temp_carbon %>%
  filter(!is.na(carbon_emissions) & year %in% c(1751, 2014)) %>%
  pull(year, carbon_emissions) %>%
  head()
  
9855/3

#3
str(temp_carbon)
temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  select(year) %>%
  min() #1880

temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  select(year) %>%
  max() #2018

temp_carbon %>%
  filter(!is.na(carbon_emissions) & year %in% c(1880)) %>%
  pull(temp_anomaly) %>%
  head()

temp_carbon %>%
  filter(!is.na(carbon_emissions) & year %in% c(2018)) %>%
  pull(temp_anomaly) %>%
  head()

z <- temp_carbon %>%
  filter(!is.na(temp_anomaly) & year %in% c(1880, 2018)) %>%
  select(year, temp_anomaly)
z
str(temp_carbon)
0.11+0.82

#4
p <- temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  ggplot(aes(year, temp_anomaly)) +
  geom_line()
p <- p + geom_hline(aes(yintercept = 0), col = "blue")
p

#5
p + ylab("Temperature anomaly (degrees C)") +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  geom_text(aes(x = 2000, y = 0.05, label = "20th century mean"), col = "blue")

#7
str(temp_carbon)
p <- temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  ggplot(aes(year, temp_anomaly)) +
  geom_line() +
  geom_hline(aes(yintercept = 0), col = "blue")
p

q <- temp_carbon %>%
  filter(!is.na(land_anomaly)) %>%
  ggplot(aes(year, land_anomaly)) +
  geom_line() +
  geom_hline(aes(yintercept = 0), col = "blue")
q

r <- temp_carbon %>%
  filter(!is.na(ocean_anomaly)) %>%
  ggplot(aes(year, ocean_anomaly)) +
  geom_line() +
  geom_hline(aes(yintercept = 0), col = "blue")
r

#Climate Change Exercises: Questions 8-12
library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

#8
str(greenhouse_gases)
greenhouse_gases %>%
  ggplot(aes(year, concentration, color = gas)) +
  geom_line() +
  facet_grid(gas ~ ., scales = "free") +
  geom_vline(aes(xintercept = 1850), col = "blue") +
  ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
  ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")

#10
temp_carbon %>%
  ggplot(aes(year, carbon_emissions)) +
  geom_line() +
  geom_vline(aes(xintercept = 1970), col = "blue")

#11
str(historic_co2)
co2_time <- historic_co2 %>%
  ggplot(aes(year, co2, color = source)) +
  geom_line()
co2_time

#12
#a
co2_time +
    xlim(-800000, -775000)
#b
co2_time +
  xlim(-375000, -330000)

#c
co2_time +
  xlim(-140000, -120000)

#d
co2_time +
  xlim(-3000, 2018)