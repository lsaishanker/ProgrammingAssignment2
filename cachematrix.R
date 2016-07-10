## This R script consists of 2 functions:-
## 1. makeCacheMatrix
## 2. cacheSolve
## These functions can be used to compute the inverse of input matrix
## and cache the inversed matrix and reference to the cached
## version of the matrix if available instead of computing each time.

## makeCacheMatrix - This function has code to get / set the input matrix
##                   and get / set the inverse matrix. It creates a special
##                   matrix that returns a list with functions to set/get input 
##                   matrix and inverse matrix.
               

makeCacheMatrix <- function(x = matrix()) {
    matrixInv <- NULL
    setMatrix <- function(y) {
        m <<- y
        matrixInv <<- NULL
    }
    getMatrix <- function(){ 
                x
            }
    setMatrixInverse <- function(matrixInverse) {
        matrixInv <<- matrixInverse
    }
    getMatrixInverse <- function() {
        matrixInv
    }
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setMatrixInverse = setMatrixInverse,
         getMatrixInverse = getMatrixInverse)
}

## cacheSolve - This function accepts an input matrix, checks to see if
##              the inverse is present in the cache and returns it if 
##              present else computes the inverse, sets it into the cache
##              and returns the inverse matrix.

cacheSolve <- function(x,...) {
    ## Return a matrix that is the inverse of 'x', or calculate & return if cache is empty
    inverseMatrix <- x$getMatrixInverse()
    if(!is.null(inverseMatrix)) {
        message("getting cached data")
        return(inverseMatrix)
    }
    
    inputMatrix <- x$getMatrix()
    inverseMatrix <- solve(inputMatrix,...)
    x$setMatrixInverse(inverseMatrix)
    inverseMatrix
}
# To run the above code
# myMatrix<-matrix(c(1:4),nrow = 2,ncol = 2, byrow = TRUE)
# y<-makeCacheMatrix(myMatrix)
# cacheSolve(y)
#[,1] [,2]
#[1,] -2.0  1.0
#[2,]  1.5 -0.5
# cacheSolve(y)
# getting cached data
#[,1] [,2]
#[1,] -2.0  1.0
#[2,]  1.5 -0.5
