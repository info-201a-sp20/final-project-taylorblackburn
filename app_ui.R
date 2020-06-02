source("page_one.R")
source("page_two.R")
source("page_three.R")
source("overview.R")
ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "Testing the Bechdel Test",
    intro_panel,
    page_one,
    page_two,
    page_three
  )
)
