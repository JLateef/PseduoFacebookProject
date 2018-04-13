setwd('C:/Users/JLateef/Downloads/eda-course-materials/lesson3/')

lesson3 <- read.csv('pseudo_facebook.tsv', sep =  '\t')

head(lesson3)

library(ggplot2)
library(gridExtra)

by(lesson3$friend_count, lesson3$gender, summary)

cond <- c(lesson3$friend_count > 26)

lesson3$results <- ifelse(cond, 'You popular', 'You lame')

lesson3 <- subset(lesson3, select  =- results)


#Box Plots

#25% of females have above 240 friends. Median female friends is around 100
ggplot(aes(x = gender, y = friend_count), 
data = subset(lesson3, !is.na(gender))) +
  geom_boxplot() + 
  coord_cartesian(ylim =c(0, 250))

#On average, who initiated more friendships?
by(lesson3$friendships_initiated, lesson3$gender, summary)

ggplot(aes(x = gender, y = friendships_initiated),
data = subset(lesson3, !is.na(gender))) +
  geom_boxplot() + coord_cartesian(ylim =c(0,250))

summary(lesson3$age > 24)

lesson3$agePoll <- c(lesson3$age > 24)
ifelse(lesson3$agePoll, 0, 1)

summary(lesson3$agePoll)

agePoll <- NA
lesson3$agePoll <- ifelse(lesson3$age > 24, 0, 1)
lesson3$agePoll <- factor(lesson3$agePoll)
summary(lesson3$agePoll)
lesson3 <- subset(lesson3, select =- agePolll)

#What percentage of users are over 24?
length(lesson3$agePoll)

sum(lesson3$age > 24)/length(lesson3$age)

?lm

                 