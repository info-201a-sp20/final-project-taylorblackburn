library(dplyr)
library(ggplot2)

# Loading our data
lockdown <- read.csv("../data/lockdown_us.csv", stringsAsFactors = FALSE)
case_states <- read.csv("../data/us-states.csv", stringsAsFactors = FALSE)

# Filter out unnecessary information from both data
filtered_lockdown <- lockdown %>% 
  select(State, Date, Type) %>% 
  rename(state = "State")

filtered_case_states <- case_states %>% 
  select(state, date, cases)

# In filtered_lockdown, filter out the most recent date for each state
recent_date_lockdown <- filtered_lockdown %>% 
  group_by(state) %>% 
  summarise(date = max(Date), type = max(Type))

# For me, to organize the data by their state
organized_states <- filtered_case_states %>% 
  group_by(state, date, cases) %>% 
  summarise()

# Merge both data into one, trying to match their date
merged_data <- recent_date_lockdown %>% 
  left_join(organized_states) %>% 
  filter(state != "Puerto Rico")

# Plot for merged_data
case_state_plot <- ggplot(data = merged_data) +
  geom_col(mapping = aes(x = state, y = cases, fill = type)) +
  ggtitle("Correlation Between Number of Cases and Type of Lockdown ") +
  coord_flip()
