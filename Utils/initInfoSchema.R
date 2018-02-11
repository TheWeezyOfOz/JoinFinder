
  source('Utils/classTbl.R')
  source('Utils/classCol.R')
  
  ######Data Prep Motherfuckers!#######
  #importing information schema from csv
  
  info.schema <- read.csv('./Information_Schema.csv')
  #each table is going to be an object with the proerties
  
  #prep for use in classTbls
  
  names(info.schema)<-tolower(names(info.schema))
  
  for (i in 1:length(info.schema$table_name)){
    info.schema[i,"UID"] <- paste0(info.schema[i,1],'.',info.schema[i,2],'.',info.schema[i,3])
  }


  U.UID <- as.list(unique(info.schema[,"UID"]))
  num.UID <- length(U.UID)
  
  U.Cols <- as.list(unique(info.schema[,4]))
  num.U.Cols <-length(U.Cols)
  
  
  ######Build a List O Tables!#######
  #Create list and add tables
  List.O.Tables <- vector("list",num.UID)
  Index.O.Tables <- vector("list",num.UID)
  
  List.O.Columns <- vector("list",num.U.Cols)
  Index.O.Columns <-vector("list",num.U.Cols)
  
  j0 <- 0
  
  for (i in 1:num.UID){
    inter <- info.schema[which(info.schema["UID"]==U.UID[i]),]
    tblDb <- as.character(inter[1,1])
    tblSchema <- as.character(inter[1,2])
    
    tblName <- as.character(inter[1,3])
    colEdge <- tblName
    Index.O.Tables[i] <-as.character(inter[1,"UID"])
    List.O.Tables[[i]] <- classTbl$new(tblDb,
                                       tblSchema,
                                       tblName)
    
    tblEdge <- as.list((inter[4]))
    length(tblEdge[[1]])
    
    for (j in 1:length(tblEdge[[1]])){
      colName <- as.character(tblEdge[[1]][j])
      colTest.Exist <- match(colName, Index.O.Columns)
      if (is.na(colTest.Exist) == TRUE){
        #create a new node
        j0=j0+1
        List.O.Columns[[j0]] <- classCol$new(colName, 
                                             as.list(colEdge))
        Index.O.Columns[j0] <- colName
      }else{
        #update edges
        List.O.Columns[colTest.Exist][[1]]$update(colEdge)
      }
      List.O.Tables[i][[1]]$update(as.character(tblEdge[[1]][j]))
    }
  }

  rm(inter, tblEdge, U.Cols, U.UID, colEdge, colName, colTest.Exist, i, j, j0, num.U.Cols, num.UID, tblDb, tblName, tblSchema)
  
  
  
  