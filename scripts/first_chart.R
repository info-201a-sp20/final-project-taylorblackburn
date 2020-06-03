library(ggplot2)
library(dplyr)
library(plotly)

# load csv
bechdel <- read.csv("./data/bechdel_test_df.csv", stringsAsFactors = FALSE)
revenue <- read.csv("./data/Bechdel-master_revenue.csv",
                    stringsAsFactors = FALSE
)

# Focus on data from 2000 - 2018
recent_bechdel <- bechdel %>%
  filter(!is.na(rating)) %>%
  filter(year > 1999)

recent_revenue <- revenue %>%
  filter(Year > 1999)

# Select important data from each list of data
bechdel_movies <- recent_bechdel %>%
  select(title, rating)

genre_movies <- recent_revenue %>%
  select(Movie, Genre) %>%
  rename(title = "Movie")

# Combine and get rid of missing data
combined_movies <- bechdel_movies %>%
  left_join(genre_movies, by = "title") %>%
  filter(!is.na(Genre)) %>%
  filter(Genre != "")

# Average out the rating for each genre and get rid
# of concert/performance and Multiple Genres
average_scale_genre <- combined_movies %>%
  group_by(Genre) %>%
  summarise(average_rating = mean(rating)) %>%
  filter(Genre != "Concert/Performance") %>%
  filter(Genre != "Multiple Genres")

# Pie with plotly
pie_genre <- plot_ly(average_scale_genre,
                     labels = ~Genre, 
                     values = ~round(average_rating,2), 
                     type = 'pie',
                     textinfo = 'label+percent',
                     marker = list(colors = c(
                       "#da7900", "#667eea", "#0038ff",
                       "#ffff00", "#d41a1a", "#06d61a", "#f05f8d",
                       "#045845", "#6b6b6b", "#a97d64", "#FFC0CB"
                     )),
                     insidetextfont = list(color = '#000000')
) %>% 
  layout(title = "<b>Movie Genre's Average Bechdel Rating: Pie Graph</b>",
         font = list(color = '#000000'),
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
  )

# Bar Graph with plotly
bar_genre <- plot_ly(average_scale_genre,
                     x = ~Genre, 
                     y = ~round(average_rating, 2), 
                     name = "Genre",
                     type = "bar",
                     marker = list(color = c(
                       "#da7900", "#667eea", "#0038ff",
                       "#ffff00", "#d41a1a", "#06d61a", "#f05f8d",
                       "#045845", "#6b6b6b", "#a97d64", "#FFC0CB"
                     )),
                     insidetextfont = list(color = '#000000')
) %>% 
  layout(title = "<b>Movie Genre's Average Bechdel Rating: Bar Graph</b>",
         font = list(color = '#000000'),
         xaxis = list(title = "Different Movie Genres"),
         yaxis = list(title = "Average Rating (0-3)"))

# Point Graph with ggplot
point_genre <- ggplot(data = average_scale_genre,
                      aes(Genre, average_rating,
                          text = paste("Genre: ", Genre,
                                       "<br>Average Rating: ", round(average_rating, 2)))) +
  geom_point(mapping = aes(Genre, average_rating),
             size = 5,
             color = c(
               "#da7900", "#667eea", "#0038ff",
               "#ffff00", "#d41a1a", "#06d61a", "#f05f8d",
               "#045845", "#6b6b6b", "#a97d64", "#FFC0CB"
             )) +
  xlab("Different Movie Genres") +
  ylab("Average Bechdel Rating (0-3)") +
  ggtitle("Movie Genre's Average Bechdel Rating: Point Graph") +
  theme(plot.title = element_text(size = 12, face = "bold", hjust = 0.5, color = "#000000")) +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 11)) +
  theme(axis.text.x = element_text(angle = -45))

point_genre <- ggplotly(point_genre, tooltip = "text")