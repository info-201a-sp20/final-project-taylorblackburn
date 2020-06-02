#Load libraries
library(shiny)
library(lintr)

# Loading our data
bechdel_rating <- read.csv("./data/bechdel_test_df.csv",
                           stringsAsFactors = FALSE)
bechdel_revenue <- read.csv("./data/Bechdel-master_revenue.csv",
                            stringsAsFactors = FALSE)
# Creating the first page
intro_panel <- tabPanel("Project Overview",
# The purpose/importance of our project
  h1("The Importance of our Project"),
  p("Over the past few decades, there have been drastic changes
    in the media to represent various marginalized groups, including
    women, people of color, disabled individuals, and members of
    the LGBTQ+ community. In order to quantify these rising levels of
    representation, there have been different processes created to
    assess the diversity of fictional films. We aim to evaluate the
    effectiveness of one of the tools used to measure the character
    development of women, known as", strong("The Bechdel Test"), "which is
    commonly used in fiction movies. A movie “passes” by following
    these three criteria:", em("(1)"), "it has to have at least two women
    in it, who", em("(2)"), "talk to each other, about", em("(3)"), "something
    besides a man."),
# Data source
  p("Our data was sourced from",
    a(href = "https://bechdeltest.com/", "thebechdeltest.com"),
    "and a",
    a(href = "https://data.world/sharon/bechdel-test", "dataset"),
    "published by Sharon Brener on Data.World."),
# What we hoped to find using our datasets
  h1("Purpose of our Project"),
  p("After merging these two datasets by a commonly shared movie title,
  we are analyzing this data that has a",
  strong("total number"),
  "of 3629 movies that date from 1925 to 2017. We hope to
  determine the",
  em("correlation"),
  "between different variables in this merged dataset
  (like the movie genre, the decade the movie was released,
  and the revenue generated from the movie) to test the
  likelihood of that film passing the Bechdel Test."),
# Questions we hoped to answer
  p("Therefore..."),
  h1("Questions we hope to answer"),
  p(strong("#1"),
    "What is the correlation between movie genre and the likelihood
    of passing the Bechdel Test?"),
  p(strong("#2"),
    "How likely is it that a movie will pass the Bechdel test based
    upon the decade that the movie was released?",
    strong("#3"),
    "upon the decade that the movie was released?"),
  p(strong("#3"),
    "How much revenue will a movie generate if it does or does not
    pass the Bechdel Test?"),
# "Visual flare"
  img("",
      src = "https://media.giphy.com/media/xT9IgzLiWOvVrMguUo/giphy.gif"),
)
