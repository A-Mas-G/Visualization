install.packages("titanic")

options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

#1
str(titanic_train)
str(titanic)
?titanic_train
levels(titanic$Survived)
levels(titanic$Pclass)
levels(titanic$Sex)

#2
titanic %>%
  ggplot(aes(Age, y = ..count.., fill = Sex)) +
  geom_density(alpha = 0.2)

titanic %>%
  ggplot(aes(Age, fill = Sex)) +
  geom_density(alpha = 0.2)

titanic %>%
  ggplot(aes(Age, y = ..count..)) +
  geom_density(alpha = 0.2) + facet_grid(Sex ~ .)

#3
t <- titanic %>%
  ggplot(aes(sample = Age))
params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age)) %>%
t + geom_qq(dparams = params) +
  geom_abline()

#4
titanic %>%
  ggplot(aes(Sex, fill = Survived)) +
  geom_bar()

titanic %>%
  ggplot(aes(Sex, fill = Survived)) +
  geom_bar(position = position_dodge())

titanic %>%
  ggplot(aes(Survived, fill = Sex)) +
  geom_bar(position = position_dodge())

#5
titanic %>%
  ggplot(aes(Age, y = ..count.., fill = Survived)) +
  geom_density(alpha = 0.2)

#6
titanic %>%
  filter(Fare > 0) %>%
  ggplot(aes(Survived, Fare)) +
  scale_y_continuous(trans = "log2") +
  geom_boxplot() +
  geom_jitter(alpha = 0.2)

#7
#a
titanic %>%
  ggplot(aes(Pclass, fill = Survived)) +
  geom_bar()

#b
titanic %>%
  ggplot(aes(Pclass, fill = Survived)) +
  geom_bar(position = position_fill())

#c
titanic %>%
  ggplot(aes(Survived, fill = Pclass)) +
  geom_bar(position = position_fill())

#8
titanic %>%
  ggplot(aes(Age, y = ..count.., fill = Survived)) +
  geom_density(alpha = 0.2) +
  facet_grid(Pclass ~ Sex)

titanic %>%
  ggplot(aes(Age, y = ..count.., fill = Survived)) +
  geom_density(alpha = 0.2) +
  facet_grid(Sex ~ Pclass)
