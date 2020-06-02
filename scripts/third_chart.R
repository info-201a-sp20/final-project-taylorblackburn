library(ggplot2)
library(dplyr)

# goal: create plot that compares bechdel test score to revenue the of
# movies from 2000-2018

# load datsets
rev <- read.csv("./data/Bechdel-master_revenue.csv",
                stringsAsFactors = FALSE)
bechdel <- read.csv("./data/bechdel_test_df.csv",
                    stringsAsFactors = FALSE)

# get rid of uneccessary columns
rev_select <- rev %>%
  select(Movie, Revenue, Year)
  
bechdel_select <- bechdel %>%
  select(title, rating)

# join tibbles
joined_data <- left_join(rev_select, bechdel_select, by = c("Movie" = "title"))

# filter out movies with no bechdel score (na values), movies where revenue
# is equal to 0, and filter out movies released before 2000 to account
# for inflation
filtered_data <- joined_data %>%
  filter(!is.na(rating)) %>%
  filter(Revenue > 0) %>%
  filter(Year > 1999) %>%
  rename(Rating = rating) %>%
  mutate(Revenue = Revenue / 1000000,
         Revenue = round(Revenue, 1))

# find average revenue of movies with each score (0-3) and scale down
# revenue to make it easier to understand on the chart
summary_values <- filtered_data %>%
  group_by(Rating) %>%
  summarise(avg_rev = mean(Revenue)) %>%
  mutate(Revenue = round(avg_rev, 1))

# make plot
plot_3 <- ggplot(data = summary_values, aes(x = Rating, y = Revenue)) +
  geom_bar(stat = "identity", fill = "pink") +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released Between
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(size = 17))

# new datasets for shiny charts
sum0 <- filtered_data %>%
  filter(Rating == 0)

sum1 <- filtered_data %>%
  filter(Rating == 1)

sum2 <- filtered_data %>%
  filter(Rating == 2)

sum3 <- filtered_data %>%
  filter(Rating == 3)

# plots for shiny

shiny_plot_0 <- ggplot(data = sum0, aes(x = Movie, y = Revenue)) +
  geom_point() +
  ggtitle("Average Revenue of Movies with a 0 Bechdel Rating") +
  xlab("Movie") + ylab("Revenue (million)") +
  theme_bw() +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 15),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "pink"))

shiny_plot_1 <- ggplot(data = sum1, aes(x = Movie, y = Revenue)) +
  geom_point() +
  ggtitle("Average Revenue of Movies with a 1 Bechdel Rating") +
  xlab("Movie") + ylab("Revenue (million)") +
  theme_bw() +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 15),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "pink"))

shiny_plot_2 <- ggplot(data = sum2, aes(x = Movie, y = Revenue)) +
  geom_point() +
  ggtitle("Average Revenue of Movies with a 2 Bechdel Rating") +
  xlab("Movie") + ylab("Revenue (million)") +
  theme_bw() +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 15),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "pink"))

shiny_plot_3 <- ggplot(data = sum3, aes(x = Movie, y = Revenue)) +
  geom_point() +
  ggtitle("Average Revenue of Movies with a 3 Bechdel Rating") +
  xlab("Movie") + ylab("Revenue (million)") +
  theme_bw() +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 15),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "pink"))
