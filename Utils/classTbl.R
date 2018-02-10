classTbl <- setRefClass(
  "classTbl",
  fields = list(
    tblDb = "character",
    tblSchema = "character",
    tblName = "character",
    tblCols = "list",
    tblChek = "numeric",
    tblPrev = "character",
    tblEdge = "list"
  ),
  methods = list(
    initialize = function(tblDb, tblSchema, tblName, tblCols, tblChek=0, tblPrev="",tblEdge)
    {
      tblDb <<- tblDb
      tblSchema <<- tblSchema
      tblName <<- tblName
      tblCols <<- tblCols
      tblChek <<- tblChek
      tblPrev <<- tblPrev
      tblEdge <<- tblEdge
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