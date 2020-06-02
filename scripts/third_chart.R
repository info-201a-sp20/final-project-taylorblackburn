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
  filter(Year > 1999)

# find average revenue of movies with each score (0-3) and scale down
# revenue to make it easier to understand on the chart
summary_values <- filtered_data %>%
  group_by(rating) %>%
  summarise(avg_rev = mean(Revenue)) %>%
  mutate(revenue = avg_rev / 1000000,
         revenue = round(revenue, 1))

# make plot
plot_3 <- ggplot(data = summary_values, aes(x = rating, y = revenue)) +
  geom_bar(stat = "identity", fill = "pink") +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(size = 17))

# new datasets for shiny charts
sum0 <- summary_values %>%
  filter(rating == 0)

sum1 <- summary_values %>%
  filter(rating == 1)

sum2 <- summary_values %>%
  filter(rating == 2)

sum3 <- summary_values %>%
  filter(rating == 3)

# plots for shiny

shiny_plot_0 <- ggplot(data = sum0, aes(x = rating, y = revenue)) +
  geom_bar(stat = "identity", fill = "pink") +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score = 0") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 17))

shiny_plot_1 <- ggplot(data = sum1, aes(x = rating, y = revenue)) +
  geom_bar(stat = "identity", fill = "pink") +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score = 1") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 17))

shiny_plot_2 <- ggplot(data = sum2, aes(x = rating, y = revenue)) +
  geom_bar(stat = "identity", fill = "pink") +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score = 2") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 17))

shiny_plot_3 <- ggplot(data = sum3, aes(x = rating, y = revenue)) +
  geom_bar(stat = "identity", fill = "pink") +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score = 3") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11),
        axis.title = element_text(size = 14),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 17))
