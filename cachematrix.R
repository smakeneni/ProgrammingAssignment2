## The functions take an input matrix and will either compute the inverse of the matrix or retrieve the inverse from cache 

## The first function makeCacheMatrix will create a matirx object that can cache its inverse. 
## Within the function it has set, get, set inverse, and get inverse functions.
## Solve function has been used to calculate the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
 m <-NULL
  set<-function(y){
    x <<-y #setting input argument to x
    m <<-NULL
  }
  get<-function() x #getting the matrix
  setinverse<-function(solve) m <<- solve #setting inverse of matrix 
  getinverse<-function() m  #gets the inverse of matrix
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## The function below computes the inverse of the matrix returned by the makeCacheMatrix or retrives the inverse from cache if it has already been computed. 

cacheSolve <- function(x, ...) {
 m <- x$getinverse()
 #checking to see if inverse has been computed
 if(!is.null(m)) {
    message("retreiving cached data from makeCacheMatrix")
    return(m)
  }
  #computing the inverse of matrix
  data <- x$get() #gets x from parent env and sets data to x
    m<-solve(data,...) #computes inverse matrix
    x$setinverse(m) #stores inverse of the matrix
    m

}
