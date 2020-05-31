source("./scripts/second_chart.R")

server <- function(input, output){
  
  output$second_chart <- renderPlot({
    ggplot(data = bechdel_df) +
      geom_line(mapping = aes(x = decade, y = rating_avg),
                color = "cornflowerblue") +
      geom_point(mapping = aes(x = decade, y = rating_avg),
                 color = "cornflowerblue") +
      scale_x_continuous(breaks = bechdel_df$decade) +
      xlim(input$x_range[1], input$x_range[2]) +
      labs(
        title = "Bechdel Test Average Across Decades",
        x = "Decade",
        y = "Bechdel Test Rating"
      ) +
      theme(axis.text.x = element_text(angle = 90),
            axis.text = element_text(size = 11),
            axis.title = element_text(size = 14),
            plot.title = element_text(size = 17),
            panel.border = element_blank(),
            panel.grid.minor = element_blank())
  })
  
}