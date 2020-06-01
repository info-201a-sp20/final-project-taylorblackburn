source("./scripts/first_chart.R")
source("./scripts/second_chart.R")
source("./scripts/third_chart.R")

library(dplyr)
library(shiny)
library(ggplot2)

server <- function(input, output){
  # Genela's Graph
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
  
  # Kaisa's Graph
  output$third_chart <- renderPlot({
    ggplot(data = summary_values, aes(x = rating, y = rev_to_scale)) +
      geom_bar(stat = "identity", fill = "pink") +
      geom_text(aes(label = rev_to_scale), vjust = 1.6, color = "white",
                size = 8) +
      theme_minimal() +
      ggtitle("Average Revenue of Movies Released from
          2000-2018 vs Bechdel Test Score") +
      xlab("Bechdel Score") + ylab("Average Revenue (million)") +
      ylim(0, 60) +
      theme(axis.text = element_text(size = 11)) +
      theme(axis.title = element_text(size = 14)) +
      theme(plot.title = element_text(size = 17))
  })
  
  # Danny's Graph
  output$first_chart <- renderPlot({
    if(input$plots == "Pie Graph"){
      pie_genre
    } else if (input$plots == "Bar Graph"){
      bar_genre
    } else if (input$plots == "Point Graph"){
      point_genre
    }
  })
}