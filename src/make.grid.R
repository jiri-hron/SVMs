## pass a 2D data-frame or array an it will return a regular grid
## of points in the full range of both dimensions of the original
## dimension
## x is the data-frame or array
## n is the number of points per row of the grid
## returns an n by n grid in original 2D space
make.grid = function(x, n = 100) {
  grange = apply(x, 2, range)
  x1 = seq(from = grange[1,1], to = grange[2,1], length = n)
  x2 = seq(from = grange[1,2], to = grange[2,2], length = n)
  expand.grid(x1 = x1, x2 = x2)
}
