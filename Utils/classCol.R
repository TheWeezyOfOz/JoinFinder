classCol <-setRefClass(
  "classCol",
  fields = list(
    colName = "character",
    colEdge = "list",
    colChek = "numeric",
    colPrev = "character"
  ),
  methods = list(
    initialize = function(colName, colEdge=as.list(c()), colChek=0, colPrev="")
    {
      colName <<- colName
      colEdge <<- colEdge
      colChek <<- colChek
      colPrev <<- colPrev
    },
    hello = function()
    {
      print("hello sunshine")
    },
    update = function(colEdgeNew)
    {
      if (colEdgeNew%in%colEdge == TRUE) {
        sprintf("%s is already in %s Node.",colEdgeNew,colName)
      }else{
      colEdge <<- c(colEdge,colEdgeNew)
      }
    }
  )
)