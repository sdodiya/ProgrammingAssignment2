## Cache the inverse of a matrix

## Usage example:

## > source('cachematrix.R')
## > m <- makeCacheMatrix(matrix(c(2, 0, 0, 2), c(2, 2)))
## > cacheSolve(m)
## [,1] [,2]
## [1,]  0.5  0.0
## [2,]  0.0  0.5


makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## Calculate the inverse of the special "matrix" 
## Function to reuse cached result (if available)

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("Getting data from Cache")
        return(i)
    }
    m <- x$get()
    i <- solve(m, ...)
    x$setinverse(i)
    i
}
