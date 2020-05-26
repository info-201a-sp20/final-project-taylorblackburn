library(ggplot2)
library(dplyr)

# goal: Create plot that compares bechdel test rating to revenue of movies from 2000-2018

# load datsets
rev <- read.csv("../data/Bechdel-master_revenue.csv", stringsAsFactors = FALSE)
bechdel <- read.csv("../data/bechdel_test_df.csv", stringsAsFactors = FALSE)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

# get rid of uneccessary columns
rev_select <- rev %>%
  select(Movie, Revenue, Year)
  
bechdel_select <- bechdel %>%
  select(title, rating)

# join tibbles
joined_data <- left_join(rev_select, bechdel_select, by = c("Movie" = "title"))

# filter out movies with no bechdel rating (na values), movies where revenue is equal to 0,
# and filter out movies released before 2000 to account for inflation
filtered_data <- joined_data %>%
  filter(!is.na(rating)) %>%
  filter(Revenue > 0) %>%
  filter(Year > 1999)

# find average revenue of each rating (0-3)
summary_values <- filtered_data %>%
  group_by(rating) %>%
  summarise(avg_revenue = mean(Revenue), max_rev = max(Revenue), min_rev = min(Revenue)) %>%
  options(scipen = 10000)

# make plot
rev_plot <- ggplot(data = summary_values) +
  geom_bar(mapping = aes(x = rating, y = avg_revenue), position = stacking) +
  ggtitle("Revenue of MBechdel Tested Movies") +
  xlab("Rating") +
  ylab("Revenue") +
  scale_y_continuous()

  ggplot( aes(x = rating, y = n, fill = name)) +
  geom_bar(stat = "identity", width = 0.5) +
  scale_fill_viridis(discrete = TRUE, name = "") +
  theme_ipsum() +
  ylab("Number of baby")
  
  

  
