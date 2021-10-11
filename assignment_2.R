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
neighborhoods <- neighborhoods %>% filter(!is.na(neighborhood)) %>% arrange(desc(n)) %>% head(n = 20)
      
### (c)
airbnb_top_neighborhoods <- airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)

### (d)
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% group_by(neighborhood) %>% summarise(
                                                                  avg_square_feet = mean(square_feet, na.rm = TRUE), 
                                                                  avg_price = mean(price, na.rm = TRUE), 
                                                                  sd_price = sd(price, na.rm = TRUE), 
                                                                  max_price = max(price, na.rm = TRUE), 
                                                                  min_price = min(price, na.rm = TRUE))

### (e)
highest_avg_square_ft <- max(summary_stats_top_neighborhoods$avg_square_feet, na.rm = TRUE)

second_avg_price <- sort(summary_stats_top_neighborhoods$avg_price, decreasing = TRUE)[2]



