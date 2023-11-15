#load in the data: 
library(carData)
library(tidyverse)
library(ggplot2)
salaries<-carData::Salaries

#visualizations: 
#boxplot: 
ggplot(salaries, aes(x=sex, y=salary, fill=sex)) + geom_boxplot()

#scatterplot:
salaries<-salaries %>% mutate(log_salary=log(salary))

ggplot(salaries, aes(x=yrs.since.phd, y=salary))+
  geom_point()+geom_smooth(method = "lm")+
  labs(x="Years Since PhD", y= "Nine-Month Salary ($)")



#data tests: 
salary_lm<-lm(salary~yrs.since.phd, data=salaries)
summary(salary_lm)

t.test(salary ~ sex, data=salaries)

