
# popPyramid <img src="imgs/hex_emblema_pyramid.png" align="right" width="120"/>

<!-- badges: start -->

![errero](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
<img src="imgs/logo_infinito.png" width="50"/>
[![Open Source Love](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![Project-Status:Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Linux](https://svgshare.com/i/Zhy.svg)](https://svgshare.com/i/Zhy.svg)
![LinuxMint](https://img.shields.io/badge/Linux_Mint-87CF3E?style=for-the2-badge&logo=linux-mint&logoColor=white)
[![CRAN-status](https://www.r-pkg.org/badges/version/popPyramid)](https://CRAN.R-project.org/package=popPyramid)
[![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/popPyramid?color=yellow)](https://CRAN.R-project.org/package=popPyramid)

<!-- badges: end -->

[**popPyramid**](https://github.com/musajajorge/popPyramid/) is a package that facilitates the elaboration of population pyramids.

## Installation :arrow_double_down:

Install **popPyramid** from [**CRAN**](https://CRAN.R-project.org/package=popPyramid):

``` r
install.packages("popPyramid")
```

or install **popPyramid** with

``` r
library(remotes)
install_github("musajajorge/popPyramid")
```

## Usage :muscle:

### Use departmental dataset in a map with ggplot2

``` r
library(mapsPERU)
df <- map_DEP

library(ggplot2)
ggplot(df, aes(geometry=geometry)) +
  geom_sf(aes(fill=DEPARTAMENTO))
```

<img src="imgs/ex1.png" width="100%" />

### Use the departmental dataset with centroids in a map with ggplot2

``` r
library(mapsPERU)
df <- map_DEP
```

<img src="imgs/ex2.png" width="100%" />

### Use the departmental dataset with centroids in a map with ggplot2

``` r
library(mapsPERU)
df <- map_DEP
```

<img src="imgs/ex3.png" width="100%" />

### Use the departmental dataset with centroids in a map with ggplot2

``` r
library(mapsPERU)
df <- map_DEP
```

<img src="imgs/ex4.png" width="100%" />

### Use the departmental dataset with centroids in a map with ggplot2

``` r
library(mapsPERU)
df <- map_DEP
```

<img src="imgs/ex5.png" width="100%" />

------------

<p align="center">
    <img src="imgs/item_infinito.png" width="40%">
</p>
