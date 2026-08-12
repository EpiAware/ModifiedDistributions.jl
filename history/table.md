|                                                                                               | d81ddd1eb1c19f...   |
|:----------------------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                               | 8.47 ± 0.097 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                               | 3.04 ± 0.048 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                                  | 0.752 ± 0.041 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                             | 6.71 ± 0.12 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                             | 17.5 ± 0.79 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)                           | 16.4 ± 0.39 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward                           | 8.78 ± 0.08 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse                           | 5.86 ± 1.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                              | 0.99 ± 0.019 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward                         | 8.34 ± 0.17 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse                         | 0.0437 ± 0.0073 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)                       | 0.0322 ± 0.00057 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                                | 8.58 ± 0.08 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                                | 3.56 ± 0.083 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                                   | 0.905 ± 0.093 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                              | 7.51 ± 0.14 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                              | 0.0399 ± 0.0086 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                            | 27.6 ± 0.54 μs      |
| AD gradients/Modified discrete logit-link per-bin logpdf/Enzyme forward                       | 13.2 ± 0.62 μs      |
| AD gradients/Modified discrete logit-link per-bin logpdf/Enzyme reverse                       | 14.4 ± 1.2 μs       |
| AD gradients/Modified discrete logit-link per-bin logpdf/ForwardDiff                          | 3.75 ± 0.71 μs      |
| AD gradients/Modified discrete logit-link per-bin logpdf/Mooncake forward                     | 24.4 ± 8.8 μs       |
| AD gradients/Modified discrete logit-link per-bin logpdf/Mooncake reverse                     | 0.127 ± 0.013 ms    |
| AD gradients/Modified discrete logit-link per-bin logpdf/ReverseDiff (tape)                   | 0.0477 ± 0.0027 ms  |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/Enzyme forward     | 0.152 ± 0.0022 ms   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/ForwardDiff        | 0.12 ± 0.00033 ms   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/Mooncake forward   | 0.489 ± 0.012 ms    |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/ReverseDiff (tape) | 0.704 ± 0.09 ms     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward                         | 8.47 ± 0.28 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse                         | 1.02 ± 0.22 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                            | 0.87 ± 0.061 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward                       | 7.14 ± 0.8 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse                       | 27.6 ± 1.8 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)                     | 16.5 ± 0.44 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                                      | 10.7 ± 0.16 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                                      | 14.2 ± 0.19 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                                         | 3.26 ± 0.037 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                                    | 12.5 ± 0.41 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                                    | 29.2 ± 4.4 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                                  | 0.0374 ± 0.00083 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward                           | 8.09 ± 0.073 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse                           | 2.02 ± 0.069 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                              | 0.513 ± 0.039 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward                         | 5.57 ± 0.17 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse                         | 23.7 ± 6.9 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)                       | 14.8 ± 0.38 μs      |
| AD gradients/Transformed series_transform LogNormal logpdf/Enzyme forward                     | 8.12 ± 0.08 μs      |
| AD gradients/Transformed series_transform LogNormal logpdf/Enzyme reverse                     | 1.99 ± 0.073 μs     |
| AD gradients/Transformed series_transform LogNormal logpdf/ForwardDiff                        | 0.513 ± 0.041 μs    |
| AD gradients/Transformed series_transform LogNormal logpdf/Mooncake forward                   | 5.44 ± 0.19 μs      |
| AD gradients/Transformed series_transform LogNormal logpdf/Mooncake reverse                   | 23.9 ± 7 μs         |
| AD gradients/Transformed series_transform LogNormal logpdf/ReverseDiff (tape)                 | 15 ± 0.39 μs        |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                                 | 8.05 ± 0.065 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                                 | 1.99 ± 0.07 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                                    | 0.515 ± 0.048 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                               | 5.53 ± 0.17 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                               | 23.7 ± 6.9 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                             | 14.8 ± 0.37 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward                           | 8.31 ± 0.094 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse                           | 0.942 ± 0.074 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                              | 0.791 ± 0.04 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward                         | 7.32 ± 0.16 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse                         | 19.3 ± 0.78 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)                       | 18.5 ± 0.45 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward                 | 8.04 ± 0.062 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse                 | 1.26 ± 0.32 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff                    | 0.546 ± 0.038 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward               | 6.03 ± 0.58 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse               | 30.2 ± 3.2 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape)             | 16.9 ± 0.38 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                                  | 8.03 ± 0.065 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                                  | 1.27 ± 0.32 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                                     | 0.546 ± 0.05 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                                | 6.05 ± 0.61 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                                | 0.0365 ± 0.0035 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                              | 16.9 ± 0.39 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward                         | 0.116 ± 0.004 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse                         | 0.348 ± 0.026 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                            | 0.0837 ± 0.001 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward                       | 0.416 ± 0.02 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse                       | 1.29 ± 0.1 ms       |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)                     | 2.52 ± 0.32 ms      |
| Affine/LogNormal/ccdf                                                                         | 3.27 ± 0.37 μs      |
| Affine/LogNormal/cdf                                                                          | 3.37 ± 0.37 μs      |
| Affine/LogNormal/construction                                                                 | 3.1 ± 0.01 ns       |
| Affine/LogNormal/logpdf                                                                       | 2.67 ± 0.33 μs      |
| Affine/LogNormal/pdf                                                                          | 4.08 ± 0.36 μs      |
| Affine/LogNormal/quantile                                                                     | 0.493 ± 0.018 μs    |
| Affine/LogNormal/rand                                                                         | 1.27 ± 0.076 μs     |
| Baseline/LogNormal/ccdf                                                                       | 2.65 ± 0.33 μs      |
| Baseline/LogNormal/cdf                                                                        | 2.64 ± 0.34 μs      |
| Baseline/LogNormal/construction                                                               | 1.55 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                                     | 1.66 ± 0.29 μs      |
| Baseline/LogNormal/pdf                                                                        | 2.96 ± 0.33 μs      |
| Baseline/LogNormal/quantile                                                                   | 0.469 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                                       | 1.03 ± 0.032 μs     |
| Modified/IdentityLink/ccdf                                                                    | 7.52 ± 0.022 μs     |
| Modified/IdentityLink/cdf                                                                     | 7.2 ± 0.022 μs      |
| Modified/IdentityLink/construction                                                            | 2.79 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                                  | 10.5 ± 0.059 μs     |
| Modified/IdentityLink/pdf                                                                     | 12.7 ± 0.06 μs      |
| Modified/IdentityLink/quantile                                                                | 0.11 ± 0.00017 ms   |
| Modified/IdentityLink/rand                                                                    | 0.579 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                                         | 5.77 ± 0.038 μs     |
| Modified/LogLink/cdf                                                                          | 6.14 ± 0.026 μs     |
| Modified/LogLink/construction                                                                 | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                                       | 8.04 ± 0.027 μs     |
| Modified/LogLink/pdf                                                                          | 9.36 ± 0.049 μs     |
| Modified/LogLink/quantile                                                                     | 0.918 ± 0.076 μs    |
| Modified/LogLink/rand                                                                         | 5.14 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                                    | 2.64 ± 0.35 μs      |
| Transformed/cumulative/construction                                                           | 3.1 ± 0.01 ns       |
| Transformed/cumulative/logpdf                                                                 | 1.65 ± 0.29 μs      |
| Transformed/cumulative/rand                                                                   | 1.03 ± 0.032 μs     |
| Transformed/thin/cdf                                                                          | 2.64 ± 0.34 μs      |
| Transformed/thin/construction                                                                 | 3.1 ± 0.01 ns       |
| Transformed/thin/logpdf                                                                       | 1.66 ± 0.31 μs      |
| Transformed/thin/rand                                                                         | 1.03 ± 0.034 μs     |
| Weighted/Product/construction                                                                 | 0.223 ± 0.08 μs     |
| Weighted/Product/logpdf                                                                       | 2.96 ± 0.24 μs      |
| Weighted/scalar/construction                                                                  | 3.1 ± 0.01 ns       |
| Weighted/scalar/logpdf                                                                        | 1.7 ± 0.31 μs       |
| time_to_load                                                                                  | 0.609 ± 0.0046 s    |

|                                                                                               | d81ddd1eb1c19f...         |
|:----------------------------------------------------------------------------------------------|:-------------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                               | 0.044 k allocs: 1.52 kB   |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                               | 24  allocs: 0.969 kB      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                                  | 7  allocs: 0.484 kB       |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                             | 0.07 k allocs: 3.33 kB    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                             | 0.291 k allocs: 13.4 kB   |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)                           | 0.248 k allocs: 10.6 kB   |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward                           | 0.04 k allocs: 1.25 kB    |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse                           | 28  allocs: 3.41 kB       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                              | 7  allocs: 0.359 kB       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward                         | 0.064 k allocs: 3.06 kB   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse                         | 0.484 k allocs: 0.0415 MB |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)                       | 0.465 k allocs: 17.8 kB   |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                                | 0.04 k allocs: 1.25 kB    |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                                | 24  allocs: 0.969 kB      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                                   | 7  allocs: 0.359 kB       |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                              | 0.064 k allocs: 3.06 kB   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                              | 0.438 k allocs: 0.039 MB  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                            | 0.377 k allocs: 14.9 kB   |
| AD gradients/Modified discrete logit-link per-bin logpdf/Enzyme forward                       | 0.307 k allocs: 13.9 kB   |
| AD gradients/Modified discrete logit-link per-bin logpdf/Enzyme reverse                       | 0.145 k allocs: 14.3 kB   |
| AD gradients/Modified discrete logit-link per-bin logpdf/ForwardDiff                          | 0.062 k allocs: 5.36 kB   |
| AD gradients/Modified discrete logit-link per-bin logpdf/Mooncake forward                     | 0.779 k allocs: 0.0345 MB |
| AD gradients/Modified discrete logit-link per-bin logpdf/Mooncake reverse                     | 1.25 k allocs: 0.107 MB   |
| AD gradients/Modified discrete logit-link per-bin logpdf/ReverseDiff (tape)                   | 0.84 k allocs: 0.0357 MB  |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/Enzyme forward     | 0.205 k allocs: 6.88 kB   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/ForwardDiff        | 0.056 k allocs: 1.75 kB   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/Mooncake forward   | 0.397 k allocs: 13.7 kB   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/ReverseDiff (tape) | 8.65 k allocs: 0.347 MB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward                         | 0.053 k allocs: 2.31 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse                         | 16  allocs: 0.922 kB      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                            | 15  allocs: 1.06 kB       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward                       | 0.116 k allocs: 6.31 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse                       | 0.372 k allocs: 23.5 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)                     | 0.239 k allocs: 10 kB     |
| AD gradients/Thinned convolved series sum/Enzyme forward                                      | 0.043 k allocs: 1.86 kB   |
| AD gradients/Thinned convolved series sum/Enzyme reverse                                      | 0.036 k allocs: 1.86 kB   |
| AD gradients/Thinned convolved series sum/ForwardDiff                                         | 13  allocs: 0.922 kB      |
| AD gradients/Thinned convolved series sum/Mooncake forward                                    | 0.094 k allocs: 4.89 kB   |
| AD gradients/Thinned convolved series sum/Mooncake reverse                                    | 0.262 k allocs: 21.5 kB   |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                                  | 0.486 k allocs: 19.4 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward                           | 0.036 k allocs: 1.11 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse                           | 14  allocs: 0.609 kB      |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                              | 7  allocs: 0.266 kB       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward                         | 0.058 k allocs: 2.91 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse                         | 0.273 k allocs: 25.6 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)                       | 0.213 k allocs: 9.06 kB   |
| AD gradients/Transformed series_transform LogNormal logpdf/Enzyme forward                     | 0.036 k allocs: 1.11 kB   |
| AD gradients/Transformed series_transform LogNormal logpdf/Enzyme reverse                     | 14  allocs: 0.609 kB      |
| AD gradients/Transformed series_transform LogNormal logpdf/ForwardDiff                        | 7  allocs: 0.266 kB       |
| AD gradients/Transformed series_transform LogNormal logpdf/Mooncake forward                   | 0.058 k allocs: 2.91 kB   |
| AD gradients/Transformed series_transform LogNormal logpdf/Mooncake reverse                   | 0.273 k allocs: 25.6 kB   |
| AD gradients/Transformed series_transform LogNormal logpdf/ReverseDiff (tape)                 | 0.213 k allocs: 9.06 kB   |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                                 | 0.036 k allocs: 1.11 kB   |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                                 | 14  allocs: 0.609 kB      |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                                    | 7  allocs: 0.266 kB       |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                               | 0.058 k allocs: 2.91 kB   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                               | 0.273 k allocs: 25.6 kB   |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                             | 0.213 k allocs: 9.06 kB   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward                           | 0.036 k allocs: 1.38 kB   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse                           | 6  allocs: 0.484 kB       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                              | 7  allocs: 0.516 kB       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward                         | 0.08 k allocs: 4.02 kB    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse                         | 0.329 k allocs: 15.6 kB   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)                       | 0.269 k allocs: 11.3 kB   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward                 | 0.032 k allocs: 1.05 kB   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse                 | 10  allocs: 1.14 kB       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff                    | 7  allocs: 0.297 kB       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward               | 0.068 k allocs: 3.59 kB   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse               | 0.32 k allocs: 0.0353 MB  |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape)             | 0.239 k allocs: 9.97 kB   |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                                  | 0.032 k allocs: 1.05 kB   |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                                  | 10  allocs: 1.14 kB       |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                                     | 7  allocs: 0.297 kB       |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                                | 0.068 k allocs: 3.59 kB   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                                | 0.348 k allocs: 0.0453 MB |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                              | 0.239 k allocs: 9.97 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward                         | 0.668 k allocs: 26 kB     |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse                         | 2.01 k allocs: 0.0974 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                            | 0.198 k allocs: 10.1 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward                       | 1.65 k allocs: 0.0702 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse                       | 8.5 k allocs: 0.854 MB    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)                     | 31.3 k allocs: 1.29 MB    |
| Affine/LogNormal/ccdf                                                                         | 2  allocs: 0.906 kB       |
| Affine/LogNormal/cdf                                                                          | 2  allocs: 0.906 kB       |
| Affine/LogNormal/construction                                                                 | 0  allocs: 0 B            |
| Affine/LogNormal/logpdf                                                                       | 2  allocs: 0.906 kB       |
| Affine/LogNormal/pdf                                                                          | 2  allocs: 0.906 kB       |
| Affine/LogNormal/quantile                                                                     | 2  allocs: 0.219 kB       |
| Affine/LogNormal/rand                                                                         | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/ccdf                                                                       | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/cdf                                                                        | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/construction                                                               | 0  allocs: 0 B            |
| Baseline/LogNormal/logpdf                                                                     | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/pdf                                                                        | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/quantile                                                                   | 2  allocs: 0.219 kB       |
| Baseline/LogNormal/rand                                                                       | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/ccdf                                                                    | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/cdf                                                                     | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/construction                                                            | 0  allocs: 0 B            |
| Modified/IdentityLink/logpdf                                                                  | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/pdf                                                                     | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/quantile                                                                | 2  allocs: 0.219 kB       |
| Modified/IdentityLink/rand                                                                    | 2  allocs: 0.906 kB       |
| Modified/LogLink/ccdf                                                                         | 2  allocs: 0.906 kB       |
| Modified/LogLink/cdf                                                                          | 2  allocs: 0.906 kB       |
| Modified/LogLink/construction                                                                 | 0  allocs: 0 B            |
| Modified/LogLink/logpdf                                                                       | 2  allocs: 0.906 kB       |
| Modified/LogLink/pdf                                                                          | 2  allocs: 0.906 kB       |
| Modified/LogLink/quantile                                                                     | 2  allocs: 0.219 kB       |
| Modified/LogLink/rand                                                                         | 2  allocs: 0.906 kB       |
| Transformed/cumulative/cdf                                                                    | 2  allocs: 0.906 kB       |
| Transformed/cumulative/construction                                                           | 0  allocs: 0 B            |
| Transformed/cumulative/logpdf                                                                 | 2  allocs: 0.906 kB       |
| Transformed/cumulative/rand                                                                   | 2  allocs: 0.906 kB       |
| Transformed/thin/cdf                                                                          | 2  allocs: 0.906 kB       |
| Transformed/thin/construction                                                                 | 0  allocs: 0 B            |
| Transformed/thin/logpdf                                                                       | 2  allocs: 0.906 kB       |
| Transformed/thin/rand                                                                         | 2  allocs: 0.906 kB       |
| Weighted/Product/construction                                                                 | 3  allocs: 2.45 kB        |
| Weighted/Product/logpdf                                                                       | 6  allocs: 2.72 kB        |
| Weighted/scalar/construction                                                                  | 0  allocs: 0 B            |
| Weighted/scalar/logpdf                                                                        | 2  allocs: 0.906 kB       |
| time_to_load                                                                                  | 0.149 k allocs: 11.2 kB   |

