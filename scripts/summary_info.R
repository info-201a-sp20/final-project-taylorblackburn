library(dplyr)

# Loading our data
bechdel_rating <- read.csv("./data/bechdel_test_df.csv",
                           stringsAsFactors = FALSE)
bechdel_revenue <- read.csv("./data/Bechdel-master_revenue.csv",
                            stringsAsFactors = FALSE)

# Merging Data
rating_select <- bechdel_rating %>%
  select(title, rating)

revenue_select <- bechdel_revenue %>%
  select(Movie, Revenue, Year, Genre)

merged_data <- left_join(revenue_select, rating_select,
                         by = c("Movie" = "title"))

bechdel_data <- merged_data %>%
  filter(!is.na(rating))

# 1. Time Frame: Dates of oldest and newest movie
oldest_year <- bechdel_data %>%
  filter(Year == min(Year)) %>%
  filter(rating == 3) %>%
  pull(Year)
  
newest_year <- bechdel_data %>%
  filter(Year == max(Year)) %>%
  filter(Movie == "Despicable Me 3") %>%
  pull(Year)
  
# 2. Total number of movies in filtered and merged dataset
total_movies <- bechdel_data %>%
  nrow()

# 3. Oldest movie that passes the Bechdel Test
oldest_pass <- bechdel_rating %>%
  filter(rating == 3) %>%
  filter(year == min(year)) %>%
  pull(title)

# 4. Movie with the most revenue that passes the Bechdel Test
most_revenue <- bechdel_data %>%
  filter(rating == 3) %>%
  filter(Revenue == max(Revenue)) %>%
  pull(Movie)

# 5. Most common movie genre that passes  the  Bechdel Test
passed_test <- bechdel_data %>%
  filter(rating == 3)

genre_most_common <- tail(names(sort(table(passed_test$Genre))), 1)
