## Put comments here that give an overall description of what your
## The functions take an input matrix and will either compute the inverse of the matrix or retrieve the inverse from cache 
## The first function makeCacheMatrix will create a matirx object that can cache its inverse. 
## Within the function it has set, get, set inverse, and get inverse functions.
## Solve function has been used to calculate the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
 m <-NULL
  set<-function(y){
    x <<-y
    m <<-NULL
  }
  get<-function() x
  setinverse<-function(solve) m <<- solve
  getinverse<-function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## The function below computes the inverse of the matrix returned by the makeCacheMatrix or retrives the inverse from cache if it has already been computed. 

cacheSolve <- function(x, ...) {
 m <- x$getinverse()
  if(!is.null(m)) {
    message("retreiving cached data from makeCacheMatrix")
    return(m)
  }
  data <- x$get()
    m<-solve(data,...)
    x$setinverse(m)
    m

}
