## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL                                            ## initialize inv as NULL; will hold value of matrix inverse 
        set <- function(y) {                                 ## define the set function to assign new 
            x <<- y                                          ## value of matrix in parent environment
            m <<- NULL
        }
        get <- function() x                                  ## Get function for matrix
        setinverse <- function(inverse) inv <<- inverse      ## Set function for matrix inverse
        getinverse <- function() inv                         ## Get function for inversed matrix
        list(set = set, get = get,                           ## Return of list of functions results
             setmean = setinverse,
             getmean = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()                      ## Pull cached value
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)                          ## Caching## Caching
    m                                        ## Return results
}
