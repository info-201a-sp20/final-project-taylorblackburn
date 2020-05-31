side_panel <- sidebarPanel(
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
  "the higher the average Bechdel Test rating.")
)

page_two <- tabPanel(
  "The Bechdel Test Across Decades",
  sidebarLayout(
    side_panel,
    main_panel
  )
)