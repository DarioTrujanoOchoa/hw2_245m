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
## a
neighborhoods <- airbnb %>% count(neighborhood)

## b
neighborhoods <- neighborhoods %>% 
  filter(!is.na(neighborhood)) %>% 
  arrange(-n) %>% 
  head(20)

## c
airbnb_top_neighborhoods <-
airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)

## d
summary_stats_top_neighborhoods <-
airbnb_top_neighborhoods %>% 
  group_by(neighborhood) %>% 
  summarise(avg_square_feet = mean(square_feet,na.rm=T), 
            avg_price = mean(price,na.rm=T), 
            sd_price = sd(price,na.rm=T), 
            max_price = max(price), 
            min_price = min(price)) %>% 
  arrange(-avg_square_feet)

## e
highest_avg_square_ft <- summary_stats_top_neighborhoods[1,"avg_square_feet"] %>% 
  pull()

## f 
second_avg_price <- summary_stats_top_neighborhoods[2,"avg_square_feet"] %>% 
  pull()

