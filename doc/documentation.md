# User Guide
Jiri Hron  
Support vector machines are one of today's most popular machine learning 
algorithms. This application is giving users a possibility to try out and
hopefully better understand SVMs' behavior.

Support vector machines are basically a generalization of _maximum margin
classifiers_ concept, which is trying to find a best separating hyperplane
w.r.t. to training observations. By best separating, we mean with largest
possible margin. To ilustrate this, look at the following figure:

![plot of chunk unnamed-chunk-1](./documentation_files/figure-html/unnamed-chunk-1.png) 

Here the solid black line shows a separating hyperplane (which is in 2D a line),
and dashed lines are showing the borders of the margin (margin is the space
between both dashed lines). As you can see in this case, size of the margin
is fully dependent only on a few points closest to the margin. 

This concept of being dependent on only a few of training observations can
produce relatively much more robust classifiers than such algorithms as
linear discriminant analysis or logistic regression.

To find such separating hyperplane, we are trying to solve this optimization
problem:

$$min_\theta C \sum_{i=1}^m \Big[ y^{(i)} cost_1(\theta^T f^{(i)})
    + (1 - y^{(i)}) cost_0 (\theta^T f^{(i)}) \Big] 
    + \frac{1}{2} \sum_{i=1}^n \theta_j^2$$ 
