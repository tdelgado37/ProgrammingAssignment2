## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  #create set function
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  #create get function
  get <- function() x
  #create get/set functions for solved data
  setSolved <- function(solve) s <<- solve
  getSolved <- function() s
  list(set = set, get = get,
       setSolved = setSolved,
       getSolved = getSolved)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  #check if solution is cached
  s <- x$getSolved()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  #if solution is not cached then get a new solution and cache it
  data <- x$get()
  s <- solve(data, ...)
  x$setSolved(s)
  s
}