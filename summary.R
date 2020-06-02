#Load libraries
library(shiny)
library(lintr)
library(dplyr)

# Loading our data
bechdel_rating <- read.csv("./data/bechdel_test_df.csv",
                           stringsAsFactors = FALSE)
bechdel_revenue <- read.csv("./data/Bechdel-master_revenue.csv",
                            stringsAsFactors = FALSE)

# Merging data
rating_select <- bechdel_rating %>%
  select(title, rating)

revenue_select <- bechdel_revenue %>%
  select(Movie, Revenue, Year, Genre)

merged_data <- left_join(revenue_select, rating_select,
                         by = c("Movie" = "title"))

bechdel_data <- merged_data %>%
  filter(!is.na(rating))

# Summary Takeaway #1 Background
oldest_pass <- bechdel_rating %>%
  filter(rating == 3) %>%
  filter(year == min(year)) %>%
  pull(title)

# Summary Takeaway #2 
oldest_year <- bechdel_data %>%
  filter(Year == min(Year)) %>%
  filter(rating == 3) %>%
  pull(Year)

newest_year <- bechdel_data %>%
  filter(Year == max(Year)) %>%
  filter(Movie == "Despicable Me 3") %>%
  pull(Year)

# Creating the conclusion page
summary_takeaways <- tabPanel("Summary Takeaways",
  h1("Takeaway #1"),
  p("One noteable observation that was gathered from our project was
    not to judge a movie based upon its stereotype. For example,", strong(oldest_pass),
    "was the oldest movie from this dataset to pass the Bechdel test. When a
    person thinks of Disney princess movies, they do not automatically envision
    the film embodying women empowerment. However, despite it's presumed stereotype,
    it was the earliest of its kind to break societal norms."),
  h1("Takeaway #2"),
  p("Our datasets ranged from", 
  strong(oldest_year), "to", strong(newest_year),
  ", it was particularly interesting to examine how movies tended to have a higher
  Bechdel rating as time went on (as shown in",
  em("The Bechdel Test across Decades"),
  "tab.) This allows us to think about what factors in the real world that could
  have caused these progressive changes in the the fictional world and the inclusivity
  of women. They are now recognized as important characters and necessary for plot development.")
)
  
