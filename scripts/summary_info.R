library(dplyr)

# Loading our data
bechdel_rating <- read.csv("../data/bechdel_test_df.csv", stringsAsFactors = FALSE)
bechdel_revenue <- read.csv("../data/Bechdel-master_revenue.csv", stringsAsFactors = FALSE)

# Merging Data
rating_select <- bechdel_rating %>%
  select(title, rating)

revenue_select <- bechdel_revenue %>%
  select(Movie, Revenue, Year, Genre)

merged_data <- left_join(revenue_select, rating_select, by = c("Movie" = "title"))

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
  
unique_values <- function(df, column_name, remove_items_with_freq_equal_or_lower_than = 0, return_df = F, 
                                           sort_desc = T, return_most_frequent_value = F)
 {
  temp <- df[column_name]
  output <- as.data.frame(table(temp))
  names(output) <- c("Item","Frequency")
  output_df <- output[  output[[2]] > remove_items_with_freq_equal_or_lower_than,  ]
  
   if (sort_desc){
    output_df <- output_df[order(output_df[[2]], decreasing = T), ]
   }
   
   cat("\nThis is the (head) count of the unique values in dataframe column '", column_name,"':\n")
  print(head(output_df))
  
   if (return_df){
    return(output_df)
   }
  
   if (return_most_frequent_value){
    output_df$Item <- as.character(output_df$Item)
    output_df$Frequency <- as.numeric(output_df$Frequency)
    most_freq_item <- output_df[1, "Item"]
    cat("\nReturning most frequent item: ", most_freq_item)
    return(most_freq_item)
   }
}

most_common_genre <- unique_values(passed_test, "Genre")

genres <- unique_values(bechdel_data, "Genre")

most <- most_common_genre  / genres

After merging two datasets by a commonly shared movie title, we are analyzing this data from a total number of # 2 movies that date from # 1 to # 1, 
We hope to determine the correlation between different variables (like the movie genre, the decade the movie was released, and the revenue generated from the movie) to the likelihood of that film passing the Bechdel Test.
The oldest movie that passed the Bechdel Test was # 3 in  1899.
The movie that generated the most revenue that passed the Bechdel Test was #4 in 1997.

