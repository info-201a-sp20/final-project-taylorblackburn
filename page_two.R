side_panel <- sidebarPanel(id="sidebar",
  sliderInput(
    inputId = "x_range", 
    label = "Change X Range:",
    min = 1900, 
    max = 2020, 
    value = c(1900, 2020), 
    step = 10)
)

main_panel <- mainPanel(
  plotOutput(
    outputId = "second_chart"
  ),
  p("This line graph is included to display if there", 
  "is a change in movies’ average Bechdel Test rating over the decades.", 
  "A line graph was chosen to display the data in order to clearly show",
  "if there’s a trend in Bechdel Test rating with movies as time progresses.",
  "The main trend seen in the graph is: the higher up the line goes,",
  "the higher the average Bechdel Test rating.",
  "In this chart, we used data from the 1900s to the present time, 2020s.",
  "One interesting point that’s seen is that there’s a weird dip in the 1920s",
  "where the average Bechdel Test rating for movies in that decade was a 1,",
  "indicating that movies during that time did not represent women very well.",
  "Another piece of information is that the average Bechdel Test rating throughout",
  "most of the decades shown in this graph is 2, revealing that movies throughout time usually met",
  "2 requirements of the Bechdel Test. Lastly, so far in the present decade (2020s),",
  "movies are averaging out to a rating of 3, meaning that movies are meeting mostly",
  "all 3 requirements of the Bechdel Test, showing a high inclusion/representation of women in movies.")
)

page_two <- tabPanel(
  "The Bechdel Test Across Decades",
  sidebarLayout(
    side_panel,
    main_panel
  )
)