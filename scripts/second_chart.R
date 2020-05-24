library(dplyr)
library(ggplot2)
rm(list=ls())
# Loading our data
healthcare_capacity <- read.csv("../data/us_healthcare_capacity.csv", stringsAsFactors = FALSE)
case_states <- read.csv("../data/us-states.csv", stringsAsFactors = FALSE)

# Filter out unnecessary information from both data
filtered_healthcare_capacity <- healthcare_capacity %>% 
  select(State.Name, Staffed.All.Beds) %>%
  rename(state = State.Name)

filtered_case_states <- case_states %>% 
  select(state, date, cases)

# In filtered_case_states, filter out the most recent date to get the total number of cases for each state
total_cases_states <- filtered_case_states %>% 
  group_by(state) %>% 
  filter(state != "Puerto Rico") %>%
  filter(state != "Guam") %>%
  filter(state != "Northern Mariana Islands") %>% 
  filter(state !="Virgin Islands") %>%
  summarise(date = max(date), cases = max(cases))

# Merge both data into one, trying to match their date
merged_data <- filtered_healthcare_capacity %>% 
  left_join(total_cases_states)
  
# Plot for merged_data
case_beds_plot <- ggplot(merged_data, aes(x = state)) +
  geom_col(aes(y=cases)) +
  geom_point(aes(y=Staffed.All.Beds), color = "blue")

