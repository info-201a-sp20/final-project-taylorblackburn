source("page_one.R")
source("page_two.R")
source("page_three.R")
source
ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "TITLE",
    page_one,
    page_two,
    page_three
  )
)
