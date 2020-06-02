source("./scripts/first_chart.R")
source("./scripts/second_chart.R")
source("./scripts/third_chart.R")

server <- function(input, output){
  # Genela's Graph
  output$second_chart <- renderPlotly({
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
  output$third_chart <- renderPlotly({
    if(input$charts == "0"){
      shiny_plot_0
    } else if (input$charts == "1"){
      shiny_plot_1
    } else if (input$charts == "2"){
      shiny_plot_2
    }
    else if (input$charts == "3"){
      shiny_plot_3
    }
    else if (input$charts == "View All Scores"){
      plot_3
    }
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
