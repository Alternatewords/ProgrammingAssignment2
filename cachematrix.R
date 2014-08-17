## This is simply a re-write of the example functions provided for the Coursera MOOC "R Programming"
## programming assignment 2. 

## Function creates a special matrix object that caches its inverse.
## Example run: a<-makeCacheMatrix(), a$set(matrix(1:4,2,2)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


## First run: Check if cached data exists > does-not > cache data
## Second run: Check if cached data exists > does > pull cache, display confirmation message
## Example first run: cacheSolve(a) > cache is empty > cache matrix
## Example second run: cacheSolve(a) > cache !is.null > retrieve cache, display message

cacheSolve <- function(x = matrix(), ...) {
        m <- x$getmatrix()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve (matrix, ...)
        x$setmatrix(m)
        m
}
