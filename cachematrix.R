## These fucntions cache the inverse of a matrix and compute it

install.packages("matlib")

## Creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()){
  ##if (ncol(x) == nrow(x) && det(x)!=0) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setInverse <- function(solve) m<<-solve
  getInverse <- function() m  
  list( set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## computes the inverse of the special cached matrix

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("Getting Cached Data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
        ## Return a matrix that is the inverse of 'x'
## Test functions

x <- matrix(rnorm(9), 3, 3)
x
p <- makeCacheMatrix(x)
cacheSolve(p)

