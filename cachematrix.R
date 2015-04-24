## Cache potentially time-consuming computations

##Function caches the inverse of a function to the need to recompute in the future


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    # create special "vector" which is a list containing a function to:
    #1 set matrix using <<- set value of object in an environment different from current environment
    #2 get matric
    #3 set the value of the inverse of a matrix using solve(x) functon
    #4 get the value of the inverse of a matrix
        s <-NULL
        set <- function (y) {
            x<<- y
            i<<- NULL
        }
        get <- function () x
        setinverse <- function (solve) s <<- solve
        getinvere <- function() i
        list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
    #check if inverse matric is cached, if so get inverse from cache, else calculate inverse
        s <- x$getinverse()
        if(!is.null(s)) {
            message("getting cached data")
            return(s)
        }
        data <- x$get()
        s <- solve(data,...)
        x$setinverse(s)
        s
}
