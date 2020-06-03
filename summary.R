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

# Summary Takeaway #2 Background
oldest_year <- bechdel_data %>%
  filter(Year == min(Year)) %>%
  filter(rating == 3) %>%
  pull(Year)

newest_year <- bechdel_data %>%
  filter(Year == max(Year)) %>%
  filter(Movie == "Despicable Me 3") %>%
  pull(Year)

# Summary Takeaway #3 Background
most_revenue <- bechdel_data %>%
  filter(rating == 3) %>%
  filter(Revenue == max(Revenue)) %>%
  pull(Movie)

# Creating the conclusion page
summary_takeaways <- tabPanel("Summary Takeaways",
  h1("Takeaway #1"),
  p("One noteable observation that we gathered from our project was the
    abilitiy to not judge a movie based upon its stereotype, particularly
    pertaining towards gender. For example,", strong(oldest_pass),
    "was the oldest movie from our merged dataset to pass the Bechdel test.
    When a person thinks of Disney princess movies, they do not automatically
    envision the film embodying women empowerment. However, despite it's
    presumed stereotype, it was the earliest of its kind to break
    societal norms."),
  h1("Takeaway #2"),
  p("Our merged dataset ranges from",
  strong(oldest_year), "to", strong(newest_year),
  ", it was particularly interesting to examine how movies tended to
  have a higher Bechdel rating as time went on (as shown in",
  em("The Bechdel Test across Decades"),
  "tab.) This allows us to think about what real-world factors
  occurring in that particular decade could
  have caused progressive changes in the fictional world of film
  and developing the inclusivity of women. They are now
  recognized as important characters and necessary for plot development."),
  h1("Takeaway #3"),
  p("Lastly, it was important to correlate the average revenue that a movie
    produces compared to how likely it is for the movie to pass
    the Bechdel Test. After doing some data analysis (as shown in",
    em("Average Revenue of Movies Released from 2000-2018 vs Bechdel
       Test Score"), "tab), it was valuable to observe that movies that scored
    a (1) on the Bechdel Test (didn't pass), generated the most revenue on average.
    This is englightening as it shows the variety of other factors that could
    have directed a movie's success upon its release. For example,",
    strong(most_revenue), "was a relevant and powerful movie that narrarated
    a widely-know catastrophe. Its success did not derive from its stance on
    women empowerment, rather its sheer popularity amongst a wide variety of
    people. Also, this data displayed that the Bechdel Test is a basic measure of
    a film's ability for including women in fictional media; it is not a perfect
    feminist litmus test. Films that do not pass may still dispel gender
    stereotypes that exist outside conventional and outdated storylines.
    On the other hand, some films that pass may involve an insignificant
    conversation between two women. Also, while the Bechdel Test is perhaps
    the most well-known test, this gives motivation to explore other metrics
    that also aim to measure inclusivity in film. The combination of these tests
    give rise to address stereotypes against race, ethnicity, and gender
    and begin debunking them.")
)
