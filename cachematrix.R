## This function receive a matrix like parameter
## This parameter is presented 
## this funcitoncontain two functions
## fist of them: Assign the matrix, obtaining new matrix
## Secon of them: # only return matrix from cache

makeCacheMatrix <- function(x = matrix()) {
  
  setMat <- function() {
    mati <<- x # Assign the matrix, obtaining new matrix
  }
  
  getMat <- function() {
    return (mati) # only return matrix from cache
  }
  
  setInverseMat<-function() {
    inverseMati <<-solve(x)
    #inserseMati <- solve(InverseMati)
  }
  
  getInverseMat <- function() {
    print ("Matrix from cache")
    print (mati)
    print ("Returning inverse from cache")
    return (inverseMati) # only return inverse from cache
  }
  
  
  list(setMat=setMat, getMat=getMat, setInverseMat=setInverseMat, getInverseMat=getInverseMat)  # generate the list
}

## This function generate the inverse of a matrix
cacheSolve <- function(x, ...) {
  if (!is.null(makeCacheMatrix()$getMat())) {
    # Obtaing de matrix inverse from matrix cache using solve()
    print ("Obtaining inverse matrix from cache")
    inverseMat <- makeCacheMatrix()$getInverseMat()
    return (inverseMat)
  }
  
  mat<-matrix(sample(1:(x*x)), nrow=x, ncol=x) # new random sqare matrix 
  makeCacheMatrix(mat)$setMat()  # setting new matrix
  makeCacheMatrix(mat)$setInverseMat()  # setting new inverse matrix
                
}
