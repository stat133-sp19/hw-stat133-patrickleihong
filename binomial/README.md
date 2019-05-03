
Overview
--------

`"binomial"` is a package specifically designed to provide functions that are able to calculate binomial probabilities and similar measures. The package offers the following functions:

-   `bin_choose()` - calculates number of combinations in which `k` number of successes occur in `n` trials.
-   `bin_probability()` - computes the binomial probability.
-   `bin_distribution()` - creates a dataframe with two classes, `bindis, data.frame`, of the binomial distribution.
-   `plot.bindis()` - method for a `bindis` object to plot the binomial distribution.
-   `bin_cumulative()`- creates a dataframe with two classes, `bincum, data.frame`, of the binomial cumulative distribution.
-   `plot.bincum()` - method for a `bincum` object to plot the binomial cumulative distribution.
-   `bin_variable()` - creates a list based off named elements `trials` and `prob`.
-   `summary.binvar()` - method for a `binvar` object and compiles summary measures into a list.
-   `bin_mean()`- computes the mean of a binomial distribution.
-   `bin_variance()`- computes the variance of a binomial distribution.
-   `bin_mode()` - computes the mode of a binomial distribution.
-   `bin_skewness()` - computes the skewness of a binomial distribution.
-   `bin_kurtosis()` - computes the kurtosis of a binomial distribution.

Motivation
----------

This package was developed to allow users to easily compute binomial probabilities and plot binomial distributions. The summary measure functions also allow users to quickly compute a measure without having to use any formulas. Other functions like `summary.binvar()` generates neatly formatted output and displays all the important measures.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-patrickleihong/binomial/")

# install "binomial" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-patrickleihong/binomial/", build_vignettes = TRUE)
```

Usage
-----

Here is a quick demonstration of what each function does:

``` r
library(binomial)

choose <- bin_choose(n = 5, k = 3)
choose
#> [1] 10

binprob <- bin_probability(success = 5, trials = 8, prob = 0.5)
binprob
#> [1] 0.21875

bindist <- bin_distribution(trials = 5, prob = 0.5)
bindist 
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

bincum <- bin_cumulative(trials = 5, prob = 0.5)
bincum
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000

binvar <- bin_variable(trials = 5, prob = 0.5)
binvar
#> "Binomial Variable"
#> 
#> Parameters 
#> - number of trials: 5 
#> - prob of success : 0.5

sumvar <- summary(binvar)
sumvar
#> "Binomial Variable"
#> 
#> Parameters 
#> - number of trials: 5 
#> - prob of success : 0.5 
#> 
#> Measures 
#> - mean    : 2.5 
#> - variance: 1.25 
#> - mode    : 3 
#> - skewness: 0 
#> - kurtosis: -0.4

mean <- bin_mean(trials = 10, prob = 0.3)
mean
#> [1] 3

var <- bin_variance(trials = 10, prob = 0.3)
var
#> [1] 2.1

mode <- bin_mode(trials = 10, prob = 0.3)
mode
#> [1] 3

skew <- bin_skewness(trials = 10, prob = 0.3)
skew
#> [1] 0.2760262

kurt <- bin_kurtosis(trials = 10, prob = 0.3)
kurt
#> [1] -0.1238095
```
