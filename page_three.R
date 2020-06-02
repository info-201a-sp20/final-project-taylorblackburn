side_panel <- sidebarPanel(id = "sidebar",
  radioButtons(
    inputId = "charts",
    label = "Select Bechdel Score",
    choices = c("Average Revenue of each Rating", "0", "1", "2", "3"),
    selected = "Average Revenue of each Rating"
  )
)

main_panel <- mainPanel(
  plotlyOutput(
    outputId = "third_chart"
  ),
  p("The above bar chart intends to illustrate the",
    "relationship between a movie's bechdel test score and",
    "the revenue earned by that movie. The chart uses revenue",
    "from movies released between 2000-2018 to attempt to",
    "account for inflation. Each column in the chart",
    "represents all the movies that received the corresponding",
    "rating and the y axis displays the average revenue of all",
    "of the movies that received each rating. As shown in the",
    "table, the highest average revenue was earned by movies",
    "that scored a 1 on the bechdel test, earning on average",
    "51.6 million dollars. The movies that scored a 1 earned",
    "on average 10 million more dollars than both movies who",
    "failed or passed the test. So, as far as we can tell, no",
    "linear relationship exists between how much money a movie",
    "earns and the bechdel test. In one way, this is good, if",
    "movies that scored lower on the bechdel test earned the most,",
    "this would indicate either that the public supports movies",
    "that do not have meaningful female roles, or simply that",
    "meaningful roles are not being supported by large production",
    "companies. However, the most desirable result would be that",
    "movies that score higher on the bechdel test, have higher",
    "average revenues, meaning that the public supports these",
    "movies and this is not supported by our analysis. In the",
    "future, we hope that more funding will be put behind movies",
    "with roles that more accurately portray women and that these",
    "films will be supported in the box office, earning more than",
    "lower scoring movies.")
)

page_three <- tabPanel(
  "Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score",
  sidebarLayout(
    side_panel,
    main_panel
  )
)