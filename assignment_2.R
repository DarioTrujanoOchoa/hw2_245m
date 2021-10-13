# assignment_2.R
# Dario Trujano Ochoa

library(tidyverse)

# Part 1 ----
## 1 ----
### a
airbnb <- read_csv("assign_2.csv")
airbnb <- airbnb %>% tibble()

### b
View(airbnb)
colnames(airbnb)

### c

airbnb <-airbnb %>% 
  rename(neighborhood=neighbourhood)

# Part 2 ----
neighborhoods <- airbnb %>% count(neighborhood)
