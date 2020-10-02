anes <- anes %>% rename('income.summary.col' = V161361x)
anes %>% 
  select(income.summary.col)
View(anes$income.summary.col)
summary(anes$income.summary.col)
table(anes$income.summary.col)


ggplot(anes) + geom_bar(mapping = aes(income.summary.col))
