|                                                                                   | 30a95603228020...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 7.64 ± 0.1 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.88 ± 0.1 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.691 ± 0.082 μs   |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.24 ± 0.45 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 15.6 ± 0.99 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16 ± 1.1 μs        |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 7.9 ± 0.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 5.42 ± 0.83 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.966 ± 0.085 μs   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 7.87 ± 0.17 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0361 ± 0.0046 ms |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 29.5 ± 1.3 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 7.73 ± 0.081 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.32 ± 0.084 μs    |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.881 ± 0.042 μs   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 6.96 ± 0.19 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0341 ± 0.0037 ms |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 25.9 ± 1.2 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 7.45 ± 0.34 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.924 ± 0.067 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.757 ± 0.074 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.83 ± 1.3 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 22.9 ± 2.3 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 15.6 ± 0.7 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 9.35 ± 0.22 μs     |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 6.58 ± 0.2 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.95 ± 0.065 μs    |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 11 ± 0.51 μs       |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 27.6 ± 3.6 μs      |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0367 ± 0.0012 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.24 ± 0.22 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.87 ± 0.086 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.466 ± 0.057 μs   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 4.98 ± 0.45 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 20.6 ± 4.7 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14 ± 0.8 μs        |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.23 ± 0.1 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.88 ± 0.067 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.463 ± 0.073 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.09 ± 0.48 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 20.7 ± 4.6 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.2 ± 0.75 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.3 ± 0.1 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.787 ± 0.055 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.729 ± 0.067 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 6.89 ± 0.45 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 16.8 ± 1.1 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 17.8 ± 1.1 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.05 ± 0.24 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.16 ± 0.32 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.502 ± 0.062 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.55 ± 0.55 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 25.6 ± 2.9 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 15.6 ± 0.79 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.06 ± 0.2 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.37 ± 0.29 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.496 ± 0.064 μs   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 5.68 ± 0.57 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 31.2 ± 3.1 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 15.7 ± 0.85 μs     |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0977 ± 0.0029 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.276 ± 0.023 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0703 ± 0.0011 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.34 ± 0.015 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.05 ± 0.055 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.28 ± 0.19 ms     |
| Affine/LogNormal/ccdf                                                             | 4.12 ± 0.21 μs     |
| Affine/LogNormal/cdf                                                              | 4.17 ± 0.21 μs     |
| Affine/LogNormal/construction                                                     | 2.71 ± 0.02 ns     |
| Affine/LogNormal/logpdf                                                           | 2.1 ± 0.28 μs      |
| Affine/LogNormal/pdf                                                              | 3.51 ± 0.25 μs     |
| Affine/LogNormal/quantile                                                         | 0.351 ± 0.019 μs   |
| Affine/LogNormal/rand                                                             | 2.13 ± 0.3 μs      |
| Baseline/LogNormal/ccdf                                                           | 3.99 ± 0.22 μs     |
| Baseline/LogNormal/cdf                                                            | 3.99 ± 0.21 μs     |
| Baseline/LogNormal/construction                                                   | 1.35 ± 0.043 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.37 ± 0.27 μs     |
| Baseline/LogNormal/pdf                                                            | 2.93 ± 0.27 μs     |
| Baseline/LogNormal/quantile                                                       | 0.345 ± 0.013 μs   |
| Baseline/LogNormal/rand                                                           | 0.941 ± 0.04 μs    |
| Modified/IdentityLink/ccdf                                                        | 8 ± 0.028 μs       |
| Modified/IdentityLink/cdf                                                         | 7.56 ± 0.042 μs    |
| Modified/IdentityLink/construction                                                | 2.35 ± 0.075 ns    |
| Modified/IdentityLink/logpdf                                                      | 11.2 ± 0.042 μs    |
| Modified/IdentityLink/pdf                                                         | 13.5 ± 0.045 μs    |
| Modified/IdentityLink/quantile                                                    | 0.12 ± 0.00013 ms  |
| Modified/IdentityLink/rand                                                        | 0.602 ± 0.023 ms   |
| Modified/LogLink/ccdf                                                             | 5.33 ± 0.071 μs    |
| Modified/LogLink/cdf                                                              | 5.79 ± 0.069 μs    |
| Modified/LogLink/construction                                                     | 2.61 ± 0.012 ns    |
| Modified/LogLink/logpdf                                                           | 5.92 ± 0.077 μs    |
| Modified/LogLink/pdf                                                              | 6.97 ± 0.062 μs    |
| Modified/LogLink/quantile                                                         | 0.693 ± 0.035 μs   |
| Modified/LogLink/rand                                                             | 4.44 ± 0.23 μs     |
| Transformed/cumulative/cdf                                                        | 3.99 ± 0.31 μs     |
| Transformed/cumulative/construction                                               | 2.36 ± 0.009 ns    |
| Transformed/cumulative/logpdf                                                     | 1.36 ± 0.26 μs     |
| Transformed/cumulative/rand                                                       | 0.942 ± 0.036 μs   |
| Transformed/thin/cdf                                                              | 3.98 ± 0.31 μs     |
| Transformed/thin/construction                                                     | 2.36 ± 0.006 ns    |
| Transformed/thin/logpdf                                                           | 1.35 ± 0.27 μs     |
| Transformed/thin/rand                                                             | 0.947 ± 0.042 μs   |
| Weighted/Product/construction                                                     | 0.465 ± 0.11 μs    |
| Weighted/Product/logpdf                                                           | 2.35 ± 0.22 μs     |
| Weighted/scalar/construction                                                      | 2.36 ± 0.006 ns    |
| Weighted/scalar/logpdf                                                            | 1.36 ± 0.26 μs     |
| time_to_load                                                                      | 0.621 ± 0.012 s    |

|                                                                                   | 30a95603228020...         |
|:----------------------------------------------------------------------------------|:-------------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 0.044 k allocs: 1.52 kB   |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 24  allocs: 0.969 kB      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 7  allocs: 0.484 kB       |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 0.07 k allocs: 3.33 kB    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 0.292 k allocs: 13.5 kB   |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 0.248 k allocs: 10.6 kB   |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 0.04 k allocs: 1.25 kB    |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 28  allocs: 3.41 kB       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 7  allocs: 0.359 kB       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 0.064 k allocs: 3.06 kB   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.485 k allocs: 0.0416 MB |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.465 k allocs: 17.8 kB   |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 0.04 k allocs: 1.25 kB    |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 24  allocs: 0.969 kB      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 7  allocs: 0.359 kB       |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 0.064 k allocs: 3.06 kB   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.439 k allocs: 0.039 MB  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 0.377 k allocs: 14.9 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 0.053 k allocs: 2.31 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 16  allocs: 0.922 kB      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 15  allocs: 1.06 kB       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 0.116 k allocs: 6.31 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 0.372 k allocs: 23.5 kB   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 0.239 k allocs: 10 kB     |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 0.046 k allocs: 1.95 kB   |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 0.04 k allocs: 1.95 kB    |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 13  allocs: 0.922 kB      |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 0.096 k allocs: 4.95 kB   |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.301 k allocs: 22.8 kB   |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.486 k allocs: 19.4 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 0.036 k allocs: 1.11 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 14  allocs: 0.609 kB      |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 7  allocs: 0.266 kB       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 0.058 k allocs: 2.91 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 0.274 k allocs: 25.6 kB   |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 0.213 k allocs: 9.06 kB   |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 0.036 k allocs: 1.11 kB   |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 14  allocs: 0.609 kB      |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 7  allocs: 0.266 kB       |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 0.058 k allocs: 2.91 kB   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 0.274 k allocs: 25.6 kB   |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 0.213 k allocs: 9.06 kB   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 0.036 k allocs: 1.38 kB   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 6  allocs: 0.484 kB       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 7  allocs: 0.516 kB       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 0.08 k allocs: 4.02 kB    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 0.329 k allocs: 15.6 kB   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 0.269 k allocs: 11.3 kB   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 0.032 k allocs: 1.05 kB   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 10  allocs: 1.14 kB       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 7  allocs: 0.297 kB       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 0.068 k allocs: 3.59 kB   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 0.32 k allocs: 0.0353 MB  |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 0.239 k allocs: 9.97 kB   |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 0.032 k allocs: 1.05 kB   |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 10  allocs: 1.14 kB       |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 7  allocs: 0.297 kB       |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 0.068 k allocs: 3.59 kB   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.348 k allocs: 0.0453 MB |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 0.239 k allocs: 9.97 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.643 k allocs: 24.8 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 1.99 k allocs: 0.0964 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.198 k allocs: 10.1 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 1.59 k allocs: 0.0674 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 8.25 k allocs: 0.841 MB   |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 31.3 k allocs: 1.29 MB    |
| Affine/LogNormal/ccdf                                                             | 2  allocs: 0.906 kB       |
| Affine/LogNormal/cdf                                                              | 2  allocs: 0.906 kB       |
| Affine/LogNormal/construction                                                     | 0  allocs: 0 B            |
| Affine/LogNormal/logpdf                                                           | 2  allocs: 0.906 kB       |
| Affine/LogNormal/pdf                                                              | 2  allocs: 0.906 kB       |
| Affine/LogNormal/quantile                                                         | 2  allocs: 0.219 kB       |
| Affine/LogNormal/rand                                                             | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/ccdf                                                           | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/cdf                                                            | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/construction                                                   | 0  allocs: 0 B            |
| Baseline/LogNormal/logpdf                                                         | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/pdf                                                            | 2  allocs: 0.906 kB       |
| Baseline/LogNormal/quantile                                                       | 2  allocs: 0.219 kB       |
| Baseline/LogNormal/rand                                                           | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/ccdf                                                        | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/cdf                                                         | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/construction                                                | 0  allocs: 0 B            |
| Modified/IdentityLink/logpdf                                                      | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/pdf                                                         | 2  allocs: 0.906 kB       |
| Modified/IdentityLink/quantile                                                    | 2  allocs: 0.219 kB       |
| Modified/IdentityLink/rand                                                        | 2  allocs: 0.906 kB       |
| Modified/LogLink/ccdf                                                             | 2  allocs: 0.906 kB       |
| Modified/LogLink/cdf                                                              | 2  allocs: 0.906 kB       |
| Modified/LogLink/construction                                                     | 0  allocs: 0 B            |
| Modified/LogLink/logpdf                                                           | 2  allocs: 0.906 kB       |
| Modified/LogLink/pdf                                                              | 2  allocs: 0.906 kB       |
| Modified/LogLink/quantile                                                         | 2  allocs: 0.219 kB       |
| Modified/LogLink/rand                                                             | 2  allocs: 0.906 kB       |
| Transformed/cumulative/cdf                                                        | 2  allocs: 0.906 kB       |
| Transformed/cumulative/construction                                               | 0  allocs: 0 B            |
| Transformed/cumulative/logpdf                                                     | 2  allocs: 0.906 kB       |
| Transformed/cumulative/rand                                                       | 2  allocs: 0.906 kB       |
| Transformed/thin/cdf                                                              | 2  allocs: 0.906 kB       |
| Transformed/thin/construction                                                     | 0  allocs: 0 B            |
| Transformed/thin/logpdf                                                           | 2  allocs: 0.906 kB       |
| Transformed/thin/rand                                                             | 2  allocs: 0.906 kB       |
| Weighted/Product/construction                                                     | 3  allocs: 2.45 kB        |
| Weighted/Product/logpdf                                                           | 6  allocs: 2.72 kB        |
| Weighted/scalar/construction                                                      | 0  allocs: 0 B            |
| Weighted/scalar/logpdf                                                            | 2  allocs: 0.906 kB       |
| time_to_load                                                                      | 0.149 k allocs: 11.2 kB   |

