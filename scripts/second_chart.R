#SECOND CHART
#timeline bar chart: bechdel test results vs. decades

#load necessary libraries
library(ggplot2)
library(dplyr)

#load csv
bechdel <- read.csv("../data/bechdel_test_df.csv", stringsAsFactors = FALSE)

#create dataframe for necessary columns and group by decade
bechdel_df <- bechdel %>%
  select(rating, year) %>% 
  mutate(decade = floor(year/10)*10) %>%
  filter(decade >= 1900) %>% 
  group_by(decade) %>% 
  summarize(
    rating_avg = round(mean(rating), 0),
  )

#create bar chart
decades_chart <- ggplot(data = bechdel_df) +
  geom_line(mapping = aes(x = decade, y = rating_avg), 
           color = "cornflowerblue") +
  geom_point(mapping = aes(x = decade, y = rating_avg), 
             color = "cornflowerblue") +
  scale_x_continuous(breaks = bechdel_df$decade) +
  labs(
    title = "Bechdel Test Average Across Decades",
    x = "Decade",
    y = "Bechdel Test Rating"
  ) +
  theme(axis.text.x = element_text(angle = 90),
        panel.border = element_blank(),
        panel.grid.minor = element_blank())


