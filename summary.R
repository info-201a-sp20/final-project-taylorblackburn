#Load libraries
library(shiny)
library(lintr)
library(dplyr)

# Loading our data
bechdel_rating <- read.csv("./data/bechdel_test_df.csv",
                           stringsAsFactors = FALSE)
bechdel_revenue <- read.csv("./data/Bechdel-master_revenue.csv",
                            stringsAsFactors = FALSE)

# Summary Takeaway #1 Background
oldest_pass <- bechdel_rating %>%
  filter(rating == 3) %>%
  filter(year == min(year)) %>%
  pull(title)

# Summary Takeaway #2 


# Creating the conclusion page
summary_takeaways <- tabPanel("Summary Takeaways",
  h1("Takeaway #1"),
  p("One noteable observation that was gathered from our project was
    not to judge a movie based upon its stereotype. For example,", em(oldest_pass),
    "was the oldest movie from this dataset to pass the Bechdel test. When a
    person thinks of Disney princess movies, they do not automatically envision
    the film embodying women empowerment. However, despite it's presumed stereotype,
    it was the earliest of its kind to break societal norms.")
)
  
