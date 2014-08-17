## This is simply a re-write of the example functions provided for the Coursera MOOC "R Programming"
## programming assignment 2. 

## Function makeCacheMatrix creates a special matrix object that caches its inverse.
## Example run: a <- makeCacheMatrix(), a$set(matrix(1:4,2,2))

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


## Function cacheSolve computes the inverse of the special "matrix" object returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed), then cachesolve retrieves
## the inverse from the cache.
## Example first run: cacheSolve(a) > cache is.null > cache inverse matrix
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
