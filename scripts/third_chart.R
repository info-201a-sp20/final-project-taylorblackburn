library(ggplot2)
library(dplyr)

# goal: Create plot that compares bechdel test score to revenue of
# movies from 2000-2018

# load datsets
rev <- read.csv("../data/Bechdel-master_revenue.csv",
                stringsAsFactors = FALSE)
bechdel <- read.csv("../data/bechdel_test_df.csv",
                    stringsAsFactors = FALSE)

# get rid of uneccessary columns
rev_select <- rev %>%
  select(Movie, Revenue, Year)
  
bechdel_select <- bechdel %>%
  select(title, rating)

# join tibbles
joined_data <- left_join(rev_select, bechdel_select, by = c("Movie" = "title"))

# Filter out movies with no bechdel score (na values), movies where revenue
# is equal to 0, and filter out movies released before 2000 to account
# for inflation.
filtered_data <- joined_data %>%
  filter(!is.na(rating)) %>%
  filter(Revenue > 0) %>%
  filter(Year > 1999)

# Find average revenue of movies with each score (0-3) and scale down
# revenue to make it easier to understand on the chart.
summary_values <- filtered_data %>%
  group_by(rating) %>%
  summarise(avg_rev = mean(Revenue)) %>%
  mutate(rev_to_scale = avg_rev / 1000000,
         rev_to_scale = round(rev_to_scale, 1))

# make plot
ggplot(data = summary_values, aes(x = rating, y = rev_to_scale)) +
  geom_bar(stat = "identity", fill = "pink") +
  geom_text(aes(label = rev_to_scale), vjust = 1.6, color = "white",
            size = 8) +
  theme_minimal() +
  ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
  xlab("Bechdel Score") + ylab("Average Revenue (million)") +
  ylim(0, 60) +
  theme(axis.text = element_text(size = 11)) +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(size = 17))
