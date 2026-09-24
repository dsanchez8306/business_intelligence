# ISA 401 Job Scout Chat: ask questions, get SQL, a table, or a chart back
library(querychat)
library(bslib)
library(shiny)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client             = client,
  tools              = c("filter", "query", "visualize"),
  greeting           = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

ui = page_sidebar(
  title = "Airbnb Query Chat",
  theme = bs_theme(primary = "#4169E1", 
                   base_font = font_google("Lato")),
  sidebar = qc$sidebar(width = 350),
  card(card_header(textOutput("title")),
       DT::DTOutput("table")),
  accordion(open = FALSE,
            accordion_panel("SQL", verbatimTextOutput("sql")),
            accordion_panel("About", 
                            "The listings come from Inside Airbnb and include Chicago (2026-07-20), Columbus (2026-07-23), and the Twin Cities (2026-07-21); built by Dominic Sanchez"))
  
)

server = function(input, output, session) {
  vals = qc$server()
  output$title = renderText(vals$title() %||% "All listings")
  output$table = DT::renderDT(vals$df(),
                              options = list(pageLength = 10))
  output$sql   = renderText(
    paste(
      "The SQL query above is generated based on your question and retrieves information from the listings table.",
      "The default query below returns all of the information pertaining to the listings table and displays it above if no question has been provided.",
      vals$sql() %||% "SELECT * FROM listings", # %||% means use the code on the left if it exists, otherwise, use the thing on the right
      sep = "\n"
    )
  )
}

shinyApp(ui, server)