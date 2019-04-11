## Pair of functions that cache the inverse of a matrix.
## This function creates a special matrix object that can cache its inverse.

## 

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
    
  }
  get<-function() x
  setInverse<-function(solveMatrix)inv<<-solvematrix
  getInverse<-function() inv
  list(get=get,set=set,setInverse=setInverse,getInverse=getInverse)
}



## In this function the function computes the inverse of the special matrix returned by the makeCacheMatrix above.
## IF THE INVERSE IS ALREADY BEING CALCULATED AND MATIRX HAS NOT CHANGED THEN THE 
## cacheSolve will retrieve the inverse from the cache  

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv<-x$getinverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data<-x$get()
  inv<-solve(data)
  x$setInverse(inv)
  inv
  
}

