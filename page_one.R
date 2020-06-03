side_panel <- sidebarPanel(id="sidebar",
  radioButtons(
    inputId = "plots",
    label = "Select what style of plot you want:",
    choices = c("Pie Graph", "Bar Graph", "Point Graph"),
    selected = "Pie Graph"
  )
)

main_panel <- mainPanel(
  plotlyOutput(
    outputId = "first_chart"
  ),
  p("These different charts were used to help differentiate the different",
    strong("movie genres and their average bechdel rating"), ". We allow our users to pick",
    "what type of plot they want to see based on their",
    "opinion of what they think is best to show this type of data. For the", strong("pie"), "graph, the larger the",
    "slice, the higher the average bechdel rating it has. For the", strong("bar and point"), "graphs, the higher",
    "the data is, the more likely it is for the genre to pass the bechdel test. We decided",
    "to include these charts so that we can see which movie genre is",
    "most likely to pass the bechdel test by comparing the general sizes or heights of",
    "the data. We used movie information",
    "from as early as the year 2000 to the most recent year 2020. From these",
    "plots, we are able to see that musicals, romantic comedies, and horror",
    "movies are the few genres that are close to receiving an average of 3",
    "on the bechdel test. However, with romantic comedies being slightly",
    "bigger than musicals by 0.02, we can deduce that", strong("romantic comedies"), " is",
    "the genre most likely to", strong("pass the bechdel test"), "compared to the other genres."),
  img(src = 'romcom.png')
)

page_one <- tabPanel(
  "Movie Genres and Their Average Bechdel Rating",
  sidebarLayout(
    side_panel,
    main_panel
  )
)
