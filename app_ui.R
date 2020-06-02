source("page_one.R")
source("page_two.R")
source("page_three.R")
source("overview.R")
source("summary.R")

ui <- fluidPage(
  includeCSS("style.css"),
  titlePanel(
    h1("Testing the Bechdel Test")
  ),
  navbarPage(
    "Navigation",
    intro_panel,
    page_one,
    page_two,
    page_three,
    summary_takeaways
  )
)
