# Final Project

## Domain of Interest

- **Why are you interested in this field/domain?**

While political and health updates surrounding COVID-19 might be overly saturated in today’s news articles and social media, it is both interesting and pertinent to understand the growing pattern of how each state is handling the pandemic and the resulting effects on various socioeconomic classes.
In particular, we wish to explore the demographics of each state including statistics regarding healthcare facility capacity and type of lockdown. We aim to compare these demographics to the growing number of confirmed COVID-19 cases state-by-state in order to determine the correlation of the virus and its potential to disproportionately affect different populations. While each person might feel that they are up to date on national regulations and laws regarding COVID-19, we noticed that there were limited sources for a complete dataset regarding the total changes and possible implications in respect to economic, political, societal impacts of each state due to the coronavirus and we hope to create a well-rounded source for this information.

- **What other examples of other data driven projects related to this domain?**

  - [Risk Perception Through the Lens of Politics in the Time of the COVID-19 Pandemic](https://bfi.uchicago.edu/wp-content/uploads/BFI_WP_202032.pdf)
      - This article, published by the Becker Friedman Institute of Chicago found evidence that supports a correlation between the percentage of Trump supporters in a county with reduced social distancing. The datasets used included measures of internet searches, county-level average daily travel distance, and visits to non-essential businesses from a large sample of U.S. smartphones.
  
  
  
  - [Covid-Neighborhood-Job-Analysis](https://github.com/UrbanInstitute/covid-neighborhood-job-analysis)
      - This project was created to help visualize how low-income jobs are being affected by COVID-19 around the United States. They hope to use this data to help get support from the government and other non-profit service providers to help low-income families who need resources, like food and child support.


  - [Covid-19-Data](https://github.com/nytimes/covid-19-data)
      - This project is using data from the New York Times to compile and keep records of the outbreak in the United States. By using the data, they hope to create a visualization to show what state is being affected most by COVID-19.

  
- **What data-driven questions do you hope to answer about this domain?**

  - How does *hospital capacity* of each state affect the degree of social distancing measures?
  
      - Using the *Healthcare Facility Capacity Information by State* data and the *Type of Lockdown by State* data, we can compare each state's hospital capacity to the type of lockdown that the respective state is experiencing.
  
  - In what ways has the virus disproportionately affected *low-income citizens and communities of color*?
  
    - Using the *COVID-19 Cases State-By-State* data, we can evaluate the number of confirmed COVID-19 cases by state and determine a correlation between different demographic groups, like income, ethnicity, or race using Census data. 
  
  - Does a *higher number of COVID-19 cases* actually predict the type of lockdown that  a state implements?
  
    - Using the *COVID-19 Cases State-By-State* data and the *Type of Lockdown by State* data, we can compare the number of confirmed coronavirus cases and the type of lockdown that each state implements or if the variation can be better explained by a different variable.  
  
## COVID-19 Data

#### Dataset 1: [COVID-19 Cases State-By-State](https://github.com/nytimes/covid-19-data/blob/master/us-states.csv)

  - The population and demographic data is sourced from the Census Bureau and various state and local health agencies and hospitals.
  
  - There are 3920 rows and 5 columns.
  
  - The questions that can be answered with this dataset:
  
      - How does hospital capacity of each state affect the degree of social distancing measures?
      
      - In what ways has the virus disproportionately affected low-income citizens and communities of color?
      
      - Does a higher number of COVID-19 cases actually predict the type of lockdown that  a state implements?
      
#### Dataset 2: [Healthcare Facility Capacity Information by State](https://github.com/covidcaremap/covid19-healthsystemcapacity/blob/master/data/published/us_healthcare_capacity-state-CovidCareMap.csv)

  - The data is sourced from the University of Washington IMHE Forecast, Harvard Global Health Institute Data, US Census data, etc.
  
  - There are 52 rows and 23 columns.
  
  - The question that can be answered with this dataset:
      
      - How does hospital capacity of each state affect the degree of social distancing measures?
      
      
#### Dataset 3: [Type of Lockdown by State](https://www.kaggle.com/lin0li/us-lockdown-dates-dataset)

  - The data is sourced from state and local governments, local news reports, and the Census Bureau.
  
  - There are 150 rows and 5 columns.
  
  - The questions that can be answered with this dataset:
      
      - How does hospital capacity of each state affect the degree of social distancing measures?
      
      - Does a higher number of COVID-19 cases actually predict the type of lockdown that  a state implements?
      