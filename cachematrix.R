## The two functions are used to create a special object that stores a matrix and cache's its inverse

## The function, makeCacheMatrix, creates a special "matrix", which is really a list containing a function to 

#1. set the value of the matrix and store it in the parent environment

#2. get the value of the matrix from the parent environment

#3. set the value of the inverse of the matrix in the parent environment

#4. get the value of the inverse of the matrix from the parent environment

## Than an output list is generated containing the functions and the variables x and Inv.
#this is a comment

makeCacheMatrix <- function(x = matrix()) {
        Inv1 <- NULL
        setmat <- function(y) {
                x <<- y
                Inv1 <<- NULL
        }
        getmat <- function() x
        setinverse <- function(solve) Inv1 <<- solve
        getinverse <- function() Inv1
        list(setmat = setmat, getmat = getmat,
             setinverse = setinverse,
             getinverse = getinverse)
        
}


## The function cacheSolve first checks to see if the inverse matrix has already been calculated.

## If so, it gets the inverse matrix from the cache and skips the computation. 

## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

## The function output is the inverse matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        Inv1 <- x$getinverse()
        if(!is.null(Inv1)) {
                message("getting cached data")
                return(Inv)
        }
        data <- x$getmat()
        Inv1 <- solve(data, ...)
        x$setinverse(Inv)
        Inv1
}
