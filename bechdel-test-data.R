library(httpr)
library(jsonlite)

base_uri <- "http://bechdeltest.com/api"
endpoint <- "/v1/getMoviesByTitle"
resource_uri <- paste0(base_uri, endpoint)
query_params <- list(q= "title")
response <- GET(resource_uri, query = query_params)
response_text <- content(response, type ="text")
bechdel_test_df <- fromJSON(response_text)

