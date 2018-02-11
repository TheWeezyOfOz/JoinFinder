#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  output$test <- renderText('Testing')
  
  #if input$textDataBases isn't null then filter info.schema to get only relevant scheams
  textDataBases <- as.character(unique(info.schema[,1]))
  
  #if input$textSchemas isn't null then filter info.schema to get only relevent tables
  textSchemas <- as.character(unique(info.schema[,2]))
  textTables <- as.character(unique(info.schema[,3]))
  
  output$chooseDatabase <- reactiveUI(function(){
    selectInput("getDatabase","Choose a Database",choices=textDataBases)
  })
  output$chooseSchema <- reactiveUI({function()
    selectInput("getSchema", "Choose a Schema", choices = textSchemas)
    })
  output$chooseTable <- reactiveUI(function(){
    selectInput("getTable", "Choose a Table", choices = textTables)
  })
  
})
