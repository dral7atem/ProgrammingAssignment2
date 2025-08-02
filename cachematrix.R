## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

##A function that implements caching the inverse of a matrix
##To save a computational resource by avoiding a repeated inversion

##makeCacheMatrix a variable that creates a special matrix that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  #inverse to NULL
  
  #set a new matrix and clear cached inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  #to get the matrix
  get <- function() x
  #to cache the inverse of matrix
  setInverse <- function(inverse) inv <<- inverse
  #to get the cached inverse
  getInverse <- function() inv
  
  #to get the list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


##cacheSolve a variable that creates and caches the inverse of the special matrix object.
##If its already been cached, it retrieves it instead of recalculating.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  #Checking for inverse if cached
  
  if (!is.null(inv)) {
    message("Getting cached inverse")
    return(inv)
  }
  
  #Cache the inverse if not cached
  mat <- x$get()
  inv <- solve(mat,...)
  x$setInverse(inv)
  
  inv  #to get the inverse
}

