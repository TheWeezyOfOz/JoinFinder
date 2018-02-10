classTbl <- setRefClass(
  "classTbl",
  fields = list(
    tblDb = "character",
    tblSchema = "character",
    tblName = "character",
    tblCols = "list",
    tblChek = "numeric",
    tblPrev = "character"
  ),
  methods = list(
    initialize = function(tblDb, tblSchema, tblName, tblCols, tblChek=0, tblPrev="")
    {
      tblDb <<- tblDb
      tblSchema <<- tblSchema
      tblName <<- tblName
      tblCols <<- tblCols
      tblChek <<- tblChek
      tblPrev <<- tblPrev
    },
    hello = function()
    {
      "hello sunshine"
    },
    printInput = function()
    {
      if(missing(input)) stop ("You have to provide an input")
      print(input)
    }
  )
)