
<!-- README.md is generated from README.Rmd. Please edit that file -->

**NOTE: This is a practice package created to explore the basics of
package development. It is not meant to be have applications outside of
my own work.**

# lupineIPM

<!-- badges: start -->
<!-- badges: end -->

The goal of lupineIPM is to streamline the construction of integral
projection models from raw demographic data, specifically data collected
from 2005-2024 by Tiffany Knight, Eleanor Pardini, and collaborators
such as myself and Aldo Compagnoni. Other similarly-structured datasets
may also be processed and fit with vital rate models that can be used to
build integral projection models using this package. This package wraps
functions I have used in my work for easier implementation in larger
projects.

## Installation

You can install the development version of lupineIPM from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aspen1030/lupineIPM")
```

## Usage

The package will contain a number of functions:

- Functions to subset raw data (ex. setup_vr_surv() )  
- Functions to extract information about vital rate models for use in
  the construction of IPMs (ex. extr_pars() )  
- Functions to wrap user-defined vital rate models into an IPM (ex.
  kernel() )  
- Functions to extract information about IPMs (ex. lambda(), sens() )  
- Functions to resample raw data, fit new vital rate models, and
  construct new IPMs (ex. sample_pars() )  
- Functions to process resampled IPMs for visualizations and uncertainty
  analysis (ex. var_decomp() )  
- … and many functions to visualize every step of the way

Examples will be added at a later point.
