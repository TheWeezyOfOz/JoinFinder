setwd(dirname(dirname(rstudioapi::getActiveDocumentContext()$path)))

library(shiny)

source("Utils/initInfoSchema.R")

shinyServer(function(input, output) {
   
  output$test <- renderText('Testing')
  
  textDataBases.A <- as.character(unique(info.schema[,1]))
  
  output$chooseDatabase <- reactiveUI(function(){
    textDataBases <- textDataBases.A
    selectizeInput("getDatabase",
                "Choose a Database",
                choices=textDataBases,
                options=list(
                  placeholder = "Please Select",
                  onInitialize = I('function() { this.setValue(""); }')
                )
    )
  })
  output$chooseSchema <- reactiveUI(function(){
    textSchemas <- as.character(unique(info.schema[which(info.schema[,1]==input$getDatabase),2]))
    selectizeInput("getSchema", 
                "Choose a Schema", 
                choices = as.list(textSchemas),
                options=list(
                  placeholder = "Please Select",
                  onInitialize = I('function() { this.setValue(""); }')
                )
      )
    })
  output$chooseTable <- reactiveUI(function(){
    textTables <- as.character(unique(info.schema[which(info.schema[,2]==input$getSchema),3]))
    selectizeInput("getTable", 
                "Choose a Table", 
                choices = textTables,
                options=list(
                  placeholder = "Please Select",
                  onInitialize = I('function() { this.setValue(""); }')
                )
      )
  })
  
  
  output$chooseDatabaseEnd <- reactiveUI(function(){
    textDataBases <- textDataBases.A
    selectizeInput("getDatabaseEnd",
                   "Choose a Database",
                   choices=textDataBases,
                   options=list(
                     placeholder = "Please Select",
                     onInitialize = I('function() { this.setValue(""); }')
                   )
    )
  })
  output$chooseSchemaEnd <- reactiveUI(function(){
    textSchemas <- as.character(unique(info.schema[which(info.schema[,1]==input$getDatabaseEnd),2]))
    selectizeInput("getSchemaEnd", 
                   "Choose a Schema", 
                   choices = as.list(textSchemas),
                   options=list(
                     placeholder = "Please Select",
                     onInitialize = I('function() { this.setValue(""); }')
                   )
    )
  })
  output$chooseTableEnd <- reactiveUI(function(){
    textTables <- as.character(unique(info.schema[which(info.schema[,2]==input$getSchemaEnd),3]))
    selectizeInput("getTableEnd", 
                   "Choose a Table", 
                   choices = textTables,
                   options=list(
                     placeholder = "Please Select",
                     onInitialize = I('function() { this.setValue(""); }')
                   )
    )
  })
})
