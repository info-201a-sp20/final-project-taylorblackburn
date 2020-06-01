library(ggplot2)
library(dplyr)

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

# Pie chart to compare genre and average ratings
col_genre <- ggplot(
  average_scale_genre,
  aes(x = "", y = average_rating, fill = Genre)
) +
  geom_bar(width = 1, stat = "identity")

pie_genre <- col_genre +
  coord_polar("y", start = 0, direction = -1) +
  scale_fill_manual(values = c(
    "#da7900", "#667eea", "#0038ff",
    "#ffff00", "#d41a1a", "#06d61a", "#f05f8d",
    "#045845", "#6b6b6b", "#a97d64", "#FFC0CB"
  )) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(size = 4, face = "bold")
  ) +
  theme(axis.text.x = element_blank()) +
  geom_text(aes(label = paste(round(average_rating, 2))),
            position = position_stack(vjust = 0.5)
  ) +
  ggtitle("Movie Genre's Average Bechdel Rating: Pie Graph") +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(size = 17))

# Bar Graph
bar_genre <- ggplot(data = average_scale_genre) +
  geom_col(mapping = aes(Genre, average_rating,
                         fill = average_rating
  ), fill = c(
    "#da7900", "#667eea", "#0038ff",
    "#ffff00", "#d41a1a", "#06d61a", "#f05f8d",
    "#045845", "#6b6b6b", "#a97d64", "#FFC0CB"
  )) +
  ylab("Average Bechdel Rating (0 - 3)") +
  xlab("Different Movie Genres") +
  ggtitle("Movie Genre's Average Bechdel Rating: Bar Graph") +
  coord_flip() +
  theme(plot.title = element_text(size = 4, face = "bold")) +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(size = 17))

# Point Graph
point_genre <- ggplot(data = average_scale_genre) +
  geom_point(mapping = aes(Genre, average_rating),
             size = 5, color = c(
               "#da7900", "#667eea", "#0038ff",
               "#ffff00", "#d41a1a", "#06d61a", "#f05f8d",
               "#045845", "#6b6b6b", "#a97d64", "#FFC0CB"
             )) +
  xlab("Different Movie Genres") +
  ylab("Average Bechdel Rating (0 - 3)") +
  ggtitle("Movie Genre's Average Bechdel Rating: Point Graph") +
  theme(plot.title = element_text(size = 4, face = "bold")) +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(size = 17))
