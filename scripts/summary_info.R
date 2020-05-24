library(dplyr)

# Loading our data
healthcare_capacity <- read.csv("../data/us_healthcare_capacity.csv", stringsAsFactors = FALSE)
case_states <- read.csv("../data/us-states.csv", stringsAsFactors = FALSE)
political_party <- read.csv("../data/governors_political_party_id.csv", stringsAsFactors = FALSE)
lockdowns <- read.csv("../data/lockdown_us.csv", stringsAsFactors = FALSE)

# 1. State with the largest total number of cases
max_cases_state <- case_states %>%
  filter(date == max(date)) %>%
  filter(cases == max(cases)) %>%
  pull(state)

# 2. State with the lowest total number of cases
min_cases_state <- case_states %>%
  filter(date == min(date)) %>%
  filter(cases == min(cases)) %>%
  pull(state)

# 3. Number of states with Republican Governers
republican <- political_party %>%
  filter(Party == "Republican") %>%
  nrow()

# 4. Number of states with Democratic Governers
democrat <- political_party %>%
  filter(Party == "Democratic") %>%
  nrow()

# 5. Example: New York w/ beds, political party, and lockdown type
# Number of beds available in New York
ny_max_beds <- healthcare_capacity %>%
  filter(State.Name == "New York") %>%
  pull(Staffed.All.Beds)

# Average number of beds per state
avg_beds <- mean(healthcare_capacity$Staffed.All.Beds)

# Ratio of beds in New York compared to the average
ny_beds_ratio <- ny_max_beds / avg_beds

# New York governer political party
ny_gov_party <- political_party %>%
  filter(Office == "Governor of New York") %>%
  pull(Party)

# New York lockdown type
ny_lockdown <- lockdowns %>%
  filter(State == "New York") %>%
  pull(Type)
  
# New York date lockdown enacted
ny_lockdown <- lockdowns %>%
  filter(State == "New York") %>%
  pull(Date)

rm(list=ls())
