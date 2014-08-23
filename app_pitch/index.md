---
title       : Support Vector Machines - interactive app
subtitle    : Try tuning SVM - watch how it behaves in different settings
author      : Jiri Hron
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## Support Vector Machines interactive
by Jiri Hron

---

## Why SVM?
<br>
  1. Currently one of the most popular algorithms among Machine Learning
  community due to its effectivness
  2. Can be used both in classification and regression settings
  3. Elegant algorithm with non-trivial implementation and tuning

---

## Who can be interested?

<br>

  1. Teachers - to demonstrate in real-time how SVMs work with different tuning
  parameters and settings
  2. Students - who are currently studying SVMs and visual demonstrations
  help them understand
  3. Geeks - who have two minutes of time and are keen on machine learning, 
  algorithms or statistics

---

<img src="assets/fig/unnamed-chunk-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

<br>

Application enables any user to quickly generate a data set and fit SVM to it 
with readily available possibility to try-out diffetent tuning parameters.

---

## Application capabilities

<p style="text-align: left">Based on this formula:</p>

$$min_\theta C \sum_{i=1}^m \Big[ y^{(i)} cost_1(\theta^T f^{(i)})
    + (1 - y^{(i)}) cost_0 (\theta^T f^{(i)}) \Big]$$
    $$+ \frac{1}{2} \sum_{i=1}^n \theta_j^2$$ 
    
<p style="text-align: left">where $cost_1$ and $cost_0$ are 
corresponding Hinge loss functions for given class you can:</p>

  * use Linear or Gaussian kernel function (here $f^{(i)}$)
  * adjust parameter $C$
  * change $\sigma$ when using Gaussian kernel
  * generate custom data set with two groups and train a new SVM instance on it

