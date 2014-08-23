svm.fit.plot <- function (x1_mean_a, x2_mean_a,
                          x1_mean_b, x2_mean_b,
                          std_a, std_b,
                          method, C, seed,
                          gauss_std) {
  if(!(require(kernlab) & require(ggplot2))) {
    stop("install kernlab and ggplot2 packages")
  }
  
  ## generate demo data
  set.seed(seed)
  
  x11 = rnorm(100, mean = x1_mean_a, sd = std_a)
  x12 = rnorm(100, mean = x2_mean_a, sd = std_a)
  x21 = rnorm(100, mean = x1_mean_b, sd = std_b)
  x22 = rnorm(100, mean = x2_mean_b, sd = std_b)
  df = data.frame(x1 = c(x11,x21), x2 = c(x12, x22))
  
  ## add response variable
  y = rep("A", 200)
  y[101:200] = "B"
  x = as.matrix(df)
  df$cat = as.factor(y)
  
  ## fit svm model
  fit.svm = NULL      
  if(method == "vanilladot") {
    fit.svm = ksvm(cat ~ .,
                   data = df,
                   scaled = TRUE,
                   type = "C-svc",
                   kernel = method,
                   C = C)
  }
  else {
    fit.svm = ksvm(cat ~ .,
                   data = df,
                   scaled = TRUE,
                   type = "C-svc",
                   kernel = method,
                   kpar = list(sigma = 0.5 * gauss_std ^ 2),
                   C = C)
  }
  
  ## make grid of all points on the graph in range of generated clusters and
  ## predict category for each of the points on the grid
  xgrid = make.grid(x)
  ygrid = predict(fit.svm, xgrid)
  df.grid = data.frame(x1 = xgrid$x1, x2 = xgrid$x2, cat = ygrid)
  
  ggplot(df.grid, aes(x = x1, y = x2, col = cat)) + 
    ## plot the grid to show separation done by hyperplane found by SVM
    geom_point(pch = 20, cex = 0.1, alpha = 0.7) +
    ## plot generated data set
    geom_point(data = df, aes(x = x1, y = x2, col = cat),
               size = 4, shape = 20) +
    ## highlight support vectors by drawing rectangles around them
    geom_point(data = df[alphaindex(fit.svm)[[1]],],
               aes(x = x1, y = x2, col = cat),
               size = 4, shape = 6) + 
    scale_color_brewer(palette = "Set1")
}
