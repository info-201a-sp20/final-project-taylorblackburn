#TABLE SUMMARY

library(dplyr)

# Loading our data
bechdel_rating <- read.csv("./data/bechdel_test_df.csv", stringsAsFactors = FALSE)
bechdel_revenue <- read.csv("./data/Bechdel-master_revenue.csv", stringsAsFactors = FALSE)

# Merging Data
rating_select <- bechdel_rating %>%
  select(title, rating)

revenue_select <- bechdel_revenue %>%
  select(Movie, Revenue, Year, Genre, Budget)

merged_data <- left_join(revenue_select, rating_select, by = c("Movie" = "title"))

bechdel_data <- merged_data %>%
  filter(!is.na(rating))
