library(ggplot2)
library(dplyr)

# load datsets
lockdown_date <- read.csv("../data/lockdown_us.csv", stringsAsFactors = FALSE)
pol_party <- read.csv("../data/gov_political_party.csv", stringsAsFactors = FALSE)

# selecting relevant columns and rows
# select state and party only 
governors_party <- pol_party %>%
  select(State, Party)

# filter out orders other than "Stay at home", then get the
# first date that the stay at home order was enacted in the state
lockdown <- lockdown_date %>%
  select(State, County, Date, Type) %>%
  filter(Type == "Stay at home") %>%
  group_by(State) %>%
  summarise(Date = min(Date))

# join the two new dataframes
gov_party_lockdown_date <- left_join(governors_party, lockdown)

# chart

gov_party_plot <- ggplot(data = gov_party_lockdown_date) +
  geom_point(mapping = aes(x = Date, y = Party, fill = type))
