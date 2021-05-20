install.packages("NHANES")
library(NHANES)
data(NHANES)

NHANES %>% filter(Gender=="male", AgeDecade==" 40-49") %>% group_by(Race1) %>% summarise(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE)) %>% arrange(average) 
NHANES %>% ggplot(aes(Gender, BPSysAve)) + geom_boxplot() + theme_economist()
