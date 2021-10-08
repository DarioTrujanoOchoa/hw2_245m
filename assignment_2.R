library(readr)
library(dplyr)

# Question 1

### (a)
airbnb <- read_csv("assign_2.csv")

### (c)
airbnb <- rename(airbnb, neighborhood = neighbourhood)


# Question 2

### (a)
neighborhoods <- airbnb %>% count(neighborhood)

### (b)
neighborhoods <- neighborhood %>% filter(!is.na(neighborhood)) %>% arrange(desc(n)) %>% head(n = 20)
      
### (c)
airbnb_top_neighborhoods <- airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)






