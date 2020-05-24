#TABLE SUMMARY

#load libraries needed
library(dplyr)

#load data
cases <- read.csv("../data/us-states.csv", stringsAsFactors = FALSE)
lockdown <- read.csv("../data/lockdown_us.csv", stringsAsFactors = FALSE)
hospital_beds <- read.csv("../data/us_healthcare_capacity.csv", stringsAsFactors = FALSE)
governors <- read.csv("../data/governors_political_party_id.csv", stringsAsFactors = FALSE)

#filter out data to get just states, cases/type of lockdown, and date
#and organize by most recent date
cases_df <- cases %>% 
  select(date, state, cases) %>% 
  group_by(state, date, cases)

lockdown_df <- lockdown %>% 
  select(State, Date, Type) %>%
  filter(State != "Puerto Rico") %>% 
  rename(state = "State") %>% 
  group_by(state) %>% 
  summarize(
    date = max(Date),
    lockdown_type = max(Type)
  )

hospital_beds_df <- hospital_beds %>% 
  select(State.Name, Staffed.All.Beds) %>% 
  rename(state = "State.Name", hospital_beds = "Staffed.All.Beds")

#remove "Governor of" from Office column in governors dataframe to get states
governors$Office <- gsub("Governor of ", "", governors$Office)

governors_df <- governors %>% 
  rename(state = "Office") %>% 
  select(state, Party)

#merge date to get most recent date of cases and lockdown type
#and create table

table <- lockdown_df %>% 
  left_join(cases_df) %>% 
  left_join(hospital_beds_df) %>%
  left_join(governors_df) %>% 
  select(state, cases, lockdown_type, hospital_beds, Party)
  
