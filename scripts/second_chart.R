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
    rating_avg = round(mean(rating), 0)
  )

<<<<<<< HEAD
filtered_deaths_states <- case_states %>%
  select(state, date, deaths)

# Filter the most recent date to get the total number of deaths for each state
total_deaths_states <- filtered_deaths_states %>%
  group_by(state) %>%
  filter(state != "Puerto Rico") %>%
  filter(state != "Guam") %>%
  filter(state != "Northern Mariana Islands") %>%
  filter(state != "Virgin Islands") %>%
  summarise(date = max(date), deaths = max(deaths))

# Merge both data into one, matching by state
merged_data <- filtered_healthcare_capacity %>%
  left_join(total_deaths_states)

# Ratio of deaths to available beds
ratio <- merged_data %>%
  mutate(ratio = deaths / Staffed.All.Beds)

correlation <- cor(ratio$deaths, ratio$Staffed.All.Beds)

plot <- ggplot(merged_data, aes(x = deaths)) +
  geom_point(aes(y = Staffed.All.Beds), color = "blue")


  geom_line(aes(correlation)

# Plot for merged_data
deaths_beds_plot <- ggplot(merged_data, aes(x = state)) +
  geom_col(aes(y = cases)) +
  geom_point(aes(y = Staffed.All.Beds), color = "blue") +
  ggtitle("Correlation between Number of Available Hospital Beds and Number of Deaths due to COVID-19") +
  xlab("State") +
  ylab("Number")
=======
#create bar chart
decades_chart <- ggplot(data = bechdel_df) +
  geom_col(mapping = aes(x = decade, y = rating_avg), 
           fill = "cornflowerblue",
           color = "black") +
  scale_x_continuous(breaks = bechdel_df$decade) +
  labs(
    title = "Bechdel Test Average Across Decades",
    x = "Decade",
    y = "Bechdel Test Rating"
  ) +
  theme(axis.text.x = element_text(angle = 90),
        panel.border = element_blank(),
        panel.grid.minor = element_blank())


>>>>>>> fbba13be827e35db72217f4e2dec3806f876467c
