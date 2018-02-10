classTbl <- setRefClass(
  "classTbl",
  fields = list(
    tblDb = "character",
    tblSchema = "character",
    tblName = "character",
    tblCols = "list",
    tblEdge = "list",
    tblChek = "numeric",
    tblPrev = "character"
  ),
  methods = list(
    initialize = function(tblDb, tblSchema, tblName, tblCols, tblEdge=as.list(c()) ,tblChek=0, tblPrev="")
    {
      tblDb <<- tblDb
      tblSchema <<- tblSchema
      tblName <<- tblName
      tblCols <<- tblCols
      tblEdge <<- tblEdge
      tblChek <<- tblChek
      tblPrev <<- tblPrev
    },
    hello = function()
    {
      "hello sunshine"
    },
    update = function(tblEdgeNew)
    {
      if (tblEdgeNew%in%tblEdge == TRUE) {
        sprintf("%s is already in %s Node.",tblEdgeNew,tblName)
      }else{
        tblEdge <<- c(tblEdge,tblEdgeNew)
      }
    }
  )
)