library(dplyr)
library(ggplot2)

# Loading our data
healthcare_capacity <- read.csv("../data/us_healthcare_capacity.csv",
                                stringsAsFactors = FALSE)
case_states <- read.csv("../data/us-states.csv", stringsAsFactors = FALSE)

# Filter out unnecessary information from both data
filtered_healthcare_capacity <- healthcare_capacity %>%
  select(State.Name, Staffed.All.Beds) %>%
  rename(state = State.Name)

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
