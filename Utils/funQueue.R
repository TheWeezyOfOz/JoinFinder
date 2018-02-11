queue = function(){ 
  e=new.env() 
  q=list() 
  assign("q",q,envir=e) 
  class(e)=c("queue","environment") 
  e 
} 

push.queue=function(e,v){ 
  q=c(v,get("q",envir=e)) 
  assign("q",q,envir=e) 
  v 
} 

pop.queue=function(e){ 
  q=get("q",envir=e) 
  v=q[[length(q)]] 
  if(length(q)==1){ 
    assign("q",list(),e) 
  }else{ 
    assign("q",q[1:(length(q)-1)],e) 
  } 
  return(v) 
} 

print.queue=function(x,...){ 
  print(get("q",envir=x)) 
} 