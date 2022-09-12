library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Análise da base mtcars"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "variavel_X",
        label = "Variável do eixo X",
        choices = names(mtcars),
        selected = "wt"
      ),
      selectInput(
        inputId = "variavel_Y",
        label = "Variável do eixo Y",
        choices = names(mtcars),
        selected = "mpg"
      )
    ),
    mainPanel(
      plotOutput("grafico")
    )
  )
)

server <- function(input, output, session) {

  output$grafico <- renderPlot({
    mtcars |>
      ggplot(aes(x = .data[[input$variavel_X]], y = .data[[input$variavel_Y]])) +
      geom_point()
  })

}

shinyApp(ui, server)
