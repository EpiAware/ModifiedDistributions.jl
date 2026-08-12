|                                                                                               | aae0a1d43d0b15...   |
|:----------------------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                               | 8.43 ± 0.1 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                               | 3.04 ± 0.06 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                                  | 0.757 ± 0.038 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                             | 6.78 ± 0.18 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                             | 16.9 ± 0.71 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)                           | 16.6 ± 0.4 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward                           | 8.75 ± 0.087 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse                           | 5.94 ± 1.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                              | 0.989 ± 0.018 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward                         | 8.3 ± 0.17 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse                         | 0.0422 ± 0.009 ms   |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)                       | 0.0323 ± 0.00066 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                                | 8.53 ± 0.094 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                                | 3.63 ± 0.088 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                                   | 0.958 ± 0.1 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                              | 7.5 ± 0.16 μs       |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                              | 0.0396 ± 0.0088 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                            | 28 ± 0.64 μs        |
| AD gradients/Modified discrete logit-link per-bin logpdf/Enzyme forward                       | 13.1 ± 0.7 μs       |
| AD gradients/Modified discrete logit-link per-bin logpdf/Enzyme reverse                       | 13.3 ± 0.72 μs      |
| AD gradients/Modified discrete logit-link per-bin logpdf/ForwardDiff                          | 3.71 ± 0.71 μs      |
| AD gradients/Modified discrete logit-link per-bin logpdf/Mooncake forward                     | 24.6 ± 8.7 μs       |
| AD gradients/Modified discrete logit-link per-bin logpdf/Mooncake reverse                     | 0.129 ± 0.012 ms    |
| AD gradients/Modified discrete logit-link per-bin logpdf/ReverseDiff (tape)                   | 0.0463 ± 0.0009 ms  |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/Enzyme forward     | 0.152 ± 0.0018 ms   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/ForwardDiff        | 0.12 ± 0.00034 ms   |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/Mooncake forward   | 0.487 ± 0.012 ms    |
| AD gradients/Modified numeric quadrature clamped additive LogNormal logpdf/ReverseDiff (tape) | 0.709 ± 0.09 ms     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward                         | 8.44 ± 0.27 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse                         | 1.04 ± 0.13 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                            | 0.91 ± 0.059 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward                       | 7.21 ± 0.84 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse                       | 28.5 ± 2 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)                     | 16.7 ± 0.43 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                                      | 10.7 ± 0.16 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                                      | 13.8 ± 0.2 μs       |
| AD gradients/Thinned convolved series sum/ForwardDiff                                         | 3.27 ± 0.037 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                                    | 12.3 ± 0.46 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                                    | 29.1 ± 4.9 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                                  | 0.0373 ± 0.00072 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward                           | 8.09 ± 0.097 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse                           | 2.01 ± 0.077 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                              | 0.526 ± 0.052 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward                         | 5.44 ± 0.2 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse                         | 23.4 ± 7 μs         |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)                       | 14.9 ± 0.38 μs      |
| AD gradients/Transformed series_transform LogNormal logpdf/Enzyme forward                     | 8.11 ± 0.083 μs     |
| AD gradients/Transformed series_transform LogNormal logpdf/Enzyme reverse                     | 2.08 ± 0.075 μs     |
| AD gradients/Transformed series_transform LogNormal logpdf/ForwardDiff                        | 0.509 ± 0.055 μs    |
| AD gradients/Transformed series_transform LogNormal logpdf/Mooncake forward                   | 5.46 ± 0.23 μs      |
| AD gradients/Transformed series_transform LogNormal logpdf/Mooncake reverse                   | 22.9 ± 6.5 μs       |
| AD gradients/Transformed series_transform LogNormal logpdf/ReverseDiff (tape)                 | 15 ± 0.41 μs        |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                                 | 8.2 ± 0.09 μs       |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                                 | 2 ± 0.059 μs        |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                                    | 0.526 ± 0.069 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                               | 5.45 ± 0.21 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                               | 23.1 ± 6.5 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                             | 14.9 ± 0.39 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward                           | 8.31 ± 0.094 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse                           | 0.943 ± 0.069 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                              | 0.876 ± 0.041 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward                         | 7.37 ± 0.17 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse                         | 19.4 ± 0.9 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)                       | 18.6 ± 0.46 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward                 | 8.02 ± 0.08 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse                 | 1.28 ± 0.31 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff                    | 0.533 ± 0.052 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward               | 5.96 ± 0.61 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse               | 30.1 ± 3 μs         |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape)             | 17.3 ± 0.44 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                                  | 8.08 ± 0.075 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                                  | 1.27 ± 0.34 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                                     | 0.546 ± 0.064 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                                | 6.08 ± 0.61 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                                | 0.0365 ± 0.0033 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                              | 17 ± 0.41 μs        |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward                         | 0.117 ± 0.0034 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse                         | 0.354 ± 0.027 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                            | 0.0839 ± 0.001 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward                       | 0.42 ± 0.018 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse                       | 1.29 ± 0.1 ms       |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)                     | 2.53 ± 0.32 ms      |
| Affine/LogNormal/ccdf                                                                         | 3.28 ± 0.38 μs      |
| Affine/LogNormal/cdf                                                                          | 3.35 ± 0.37 μs      |
| Affine/LogNormal/construction                                                                 | 3.41 ± 0.01 ns      |
| Affine/LogNormal/logpdf                                                                       | 2.63 ± 0.35 μs      |
| Affine/LogNormal/pdf                                                                          | 3.79 ± 0.39 μs      |
| Affine/LogNormal/quantile                                                                     | 0.492 ± 0.02 μs     |
| Affine/LogNormal/rand                                                                         | 1.27 ± 0.071 μs     |
| Baseline/LogNormal/ccdf                                                                       | 2.67 ± 0.32 μs      |
| Baseline/LogNormal/cdf                                                                        | 2.65 ± 0.35 μs      |
| Baseline/LogNormal/construction                                                               | 1.55 ± 0.009 ns     |
| Baseline/LogNormal/logpdf                                                                     | 1.66 ± 0.29 μs      |
| Baseline/LogNormal/pdf                                                                        | 2.94 ± 0.33 μs      |
| Baseline/LogNormal/quantile                                                                   | 0.473 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                                       | 1.04 ± 0.034 μs     |
| Modified/IdentityLink/ccdf                                                                    | 7.52 ± 0.035 μs     |
| Modified/IdentityLink/cdf                                                                     | 7.19 ± 0.025 μs     |
| Modified/IdentityLink/construction                                                            | 3.1 ± 0.01 ns       |
| Modified/IdentityLink/logpdf                                                                  | 10.5 ± 0.06 μs      |
| Modified/IdentityLink/pdf                                                                     | 12.7 ± 0.06 μs      |
| Modified/IdentityLink/quantile                                                                | 0.111 ± 0.00017 ms  |
| Modified/IdentityLink/rand                                                                    | 0.578 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                                         | 5.78 ± 0.052 μs     |
| Modified/LogLink/cdf                                                                          | 6.14 ± 0.036 μs     |
| Modified/LogLink/construction                                                                 | 2.79 ± 0.01 ns      |
| Modified/LogLink/logpdf                                                                       | 8.04 ± 0.031 μs     |
| Modified/LogLink/pdf                                                                          | 9.36 ± 0.051 μs     |
| Modified/LogLink/quantile                                                                     | 0.937 ± 0.073 μs    |
| Modified/LogLink/rand                                                                         | 5.13 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                                    | 2.65 ± 0.34 μs      |
| Transformed/cumulative/construction                                                           | 4.02 ± 0.01 ns      |
| Transformed/cumulative/logpdf                                                                 | 1.66 ± 0.29 μs      |
| Transformed/cumulative/rand                                                                   | 1.03 ± 0.031 μs     |
| Transformed/thin/cdf                                                                          | 2.65 ± 0.32 μs      |
| Transformed/thin/construction                                                                 | 3.1 ± 0.01 ns       |
| Transformed/thin/logpdf                                                                       | 1.65 ± 0.29 μs      |
| Transformed/thin/rand                                                                         | 1.03 ± 0.03 μs      |
| Weighted/Product/construction                                                                 | 0.242 ± 0.046 μs    |
| Weighted/Product/logpdf                                                                       | 2.95 ± 0.24 μs      |
| Weighted/scalar/construction                                                                  | 3.41 ± 0.001 ns     |
| Weighted/scalar/logpdf                                                                        | 1.74 ± 0.31 μs      |
| time_to_load                                                                                  | 0.622 ± 0.016 s     |

|                                                                                               | aae0a1d43d0b15...         |
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

