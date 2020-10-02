## Attempting to replicate Michael Roberts's ROP

# Load data
df <- read_csv("data/Tables 1.10, 4.1, 4.3 (edited).csv")
anes <- read_dta("data/anes_timeseries_2016.dta")

View(anes)

View(df)

# install/load packages
library(tidyverse)

a <- df %>%
  select(`Gross domestic income`, Year)
view(a)

b <- df %>%
  select(`Compensation of employees, paid`, Year)

c <- df %>%
  select(`Consumption of fixed capital`, Year)

d <- df %>%
  select(`Historic Cost Private nonresidential fixed assets`, Year)

e <- df %>%
  select(`Current Cost Private nonresidential fixed assets`, Year)


# gonna try and do a mutate thing lol

fig3 <- df %>%
  mutate(profit.rate.current = (`Gross domestic income` - `Compensation of employees, paid` - `Consumption of fixed capital`)/
           (`Current Cost Private nonresidential fixed assets`+`Compensation of employees, paid`))
view(fig3.current) 

(fig3.current$profit.rate)

fig3 <- df %>%
  mutate(profit.rate.hist = (`Gross domestic income` - `Compensation of employees, paid` - `Consumption of fixed capital`)/
           (`Historic Cost Private nonresidential fixed assets`+`Compensation of employees, paid`)) %>%
  mutate(profit.rate.current = (`Gross domestic income` - `Compensation of employees, paid` - `Consumption of fixed capital`)/
           (`Current Cost Private nonresidential fixed assets`+`Compensation of employees, paid`))

fig3.plot <- ggplot(fig3) +
  geom_line(mapping = aes(Year, profit.rate.hist), color = "darkred", group = "profit.rate.hist") + 
  geom_line(mapping = aes(Year, profit.rate.current), color = "steelblue", group = "profit.rate.current") + 
  ylab("Average Profit Rate") +
  labs(title = "Post-WWII U.S. Average Rate of Profit",
     xlab = "Year") +
  geom_text(label = 'Historic',
            x = 2000,
            y = 0.25) +
  geom_text(label = 'Current',
            x = 2020,
            y = 0.15)

fig3.plot

 
fig3.plot2 <- ggplot(fig3, Year) + 
  geom_line(aes(x = Year, y = profit.rate.hist), color = "darkred") + 
  geom_line(aes(x = Year, y = profit.rate.current), color = "steelblue") +
  scale_x_discrete(limits = c("1946":"2019")) +
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("Rate of Profit") +
  labs(title = "Post-WWII U.S. Average Rate of Profit",
       xlab = "Year")


fig3.plot2








