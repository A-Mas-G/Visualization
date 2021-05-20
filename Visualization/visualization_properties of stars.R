library(tidyverse)
library(dslabs)
data(stars)
options(digits = 3)   # report 3 significant digits

#1
str(stars)
mean(stars$magnitude)
mean(abs(stars$magnitude))
sd(stars$magnitude)
sd(abs(stars$magnitude))

#2
stars %>%
  ggplot(aes(magnitude)) +
  geom_density()

#3
stars %>%
  ggplot(aes(temp)) +
  geom_density()

#4
stars %>%
  ggplot(aes(temp, magnitude)) +
  geom_point()

#5
stars %>%
  ggplot(aes(temp, magnitude)) +
  scale_y_reverse() +
  scale_x_continuous(trans = "log10") +
  scale_x_reverse() +
  geom_point()

#8
stars %>%
  ggplot(aes(temp, magnitude, label = star)) +
  scale_y_reverse() +
  scale_x_continuous(trans = "log10") +
  scale_x_reverse() +
  geom_point() +
  geom_text_repel()
#NOTE: more luminous stars have lower magnitude

#9
stars %>%
  ggplot(aes(temp, magnitude, color = type, label = type)) +
  scale_y_reverse() +
  scale_x_continuous(trans = "log10") +
  scale_x_reverse() +
  geom_point() +
  geom_text_repel()