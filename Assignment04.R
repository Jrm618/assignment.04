library(tidyverse)

df <- read.csv('us-counties-recent.csv')

dfN <- df[df$state == 'Pennsylvania' & df$date == '4/10/21',]

p <- ggplot(data = dfN,
            mapping = aes (x = cases, y = deaths))

p + geom_point() + 
  geom_text(mapping=aes(label=ifelse(deaths>500,county, ''))) +
  labs(x = 'Cases', y = 'Deaths', 
       title = 'COVID-19 Deaths vs Cases for PA as of 2021-04-10',
       subtitle = 'Jason Magid') +
  geom_smooth(method=lm, se=FALSE)
