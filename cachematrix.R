## This code creates a function that sets the values of a matrix and caches the inverse of the matrix
## The first function sets the values of the matrix, gets the values of the matrix, sets the values of the inverse of the matrix and gets the values of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
       amatrix <- NULL
       set <- function(y) {
               x <<- y
               amatrix <<- NULL
       }
       get <- function() x
       setmatrixinverse <- function(solve) amatrix <<- solve
       getmatrixinverse <- function() amatrix
       list(set = set, get = get,
            setmatrixinverse = setmatrixinverse,
            getmatrixinverse = getmatrixinverse)
}



## This function calculates the inverse of the matrix from the above function but first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise it calculates the inverse of the matrix and sets the values of the inverse matrix in the cache using the setmatrixinverse function

cacheSolve <- function(x, ...) {
        amatrix <- x$getmatrixinverse()
        if(!is.null(amatrix)) {
                message("getting cached matrix")
                return(amatrix)
        }
        data <- x$get()
        amatrix <- solve(data, ...)
        x$setmatrixinverse(amatrix)
        amatrix
        
      }

