|                                                                                   | 0ef6398da230cf...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.08 ± 0.13 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.98 ± 0.12 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.814 ± 0.13 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 7.36 ± 0.41 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18.3 ± 0.93 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.3 ± 0.54 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.32 ± 0.13 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 6.4 ± 1.4 μs        |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.01 ± 0.024 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.78 ± 0.17 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0432 ± 0.0056 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.032 ± 0.00081 ms  |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.14 ± 0.13 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.55 ± 0.091 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.958 ± 0.13 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.95 ± 0.17 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.041 ± 0.0049 ms   |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 27.1 ± 0.72 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.04 ± 0.44 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.07 ± 0.25 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.946 ± 0.072 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.44 ± 0.52 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 27 ± 2.7 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.4 ± 0.56 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.3 ± 0.23 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.6 ± 0.24 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.33 ± 0.053 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.8 ± 0.48 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 28.5 ± 4.6 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0363 ± 0.00084 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.66 ± 0.11 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.99 ± 0.056 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.527 ± 0.09 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.71 ± 0.34 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 24.6 ± 6.8 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.9 ± 0.48 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.63 ± 0.11 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.98 ± 0.054 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.527 ± 0.089 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.77 ± 0.31 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.5 ± 6.8 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 15 ± 0.5 μs         |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.82 ± 0.14 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.968 ± 0.076 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.834 ± 0.13 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.94 ± 0.46 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19.6 ± 1.3 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.1 ± 0.52 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.56 ± 0.11 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.25 ± 0.36 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.564 ± 0.09 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.44 ± 0.4 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 30.1 ± 2.8 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.1 ± 0.52 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.55 ± 0.11 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.25 ± 0.41 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.58 ± 0.089 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.46 ± 0.38 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0378 ± 0.0032 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.2 ± 0.52 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.115 ± 0.0035 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.317 ± 0.026 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.087 ± 0.0011 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.417 ± 0.02 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.17 ± 0.069 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.31 ± 0.37 ms      |
| Affine/LogNormal/ccdf                                                             | 3.53 ± 0.43 μs      |
| Affine/LogNormal/cdf                                                              | 3.58 ± 0.44 μs      |
| Affine/LogNormal/construction                                                     | 3.48 ± 0.001 ns     |
| Affine/LogNormal/logpdf                                                           | 2.66 ± 0.4 μs       |
| Affine/LogNormal/pdf                                                              | 4.23 ± 0.24 μs      |
| Affine/LogNormal/quantile                                                         | 0.472 ± 0.02 μs     |
| Affine/LogNormal/rand                                                             | 1.26 ± 0.06 μs      |
| Baseline/LogNormal/ccdf                                                           | 2.73 ± 0.39 μs      |
| Baseline/LogNormal/cdf                                                            | 2.72 ± 0.4 μs       |
| Baseline/LogNormal/construction                                                   | 1.74 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.55 ± 0.36 μs      |
| Baseline/LogNormal/pdf                                                            | 3.35 ± 0.43 μs      |
| Baseline/LogNormal/quantile                                                       | 0.454 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                           | 1.08 ± 0.037 μs     |
| Modified/IdentityLink/ccdf                                                        | 8.51 ± 0.017 μs     |
| Modified/IdentityLink/cdf                                                         | 8.09 ± 0.023 μs     |
| Modified/IdentityLink/construction                                                | 3.13 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 11.8 ± 0.041 μs     |
| Modified/IdentityLink/pdf                                                         | 14.4 ± 0.051 μs     |
| Modified/IdentityLink/quantile                                                    | 0.118 ± 0.00012 ms  |
| Modified/IdentityLink/rand                                                        | 0.655 ± 0.016 ms    |
| Modified/LogLink/ccdf                                                             | 6.18 ± 0.054 μs     |
| Modified/LogLink/cdf                                                              | 6.7 ± 0.036 μs      |
| Modified/LogLink/construction                                                     | 3.48 ± 0.001 ns     |
| Modified/LogLink/logpdf                                                           | 7.79 ± 0.037 μs     |
| Modified/LogLink/pdf                                                              | 8.88 ± 0.033 μs     |
| Modified/LogLink/quantile                                                         | 0.885 ± 0.028 μs    |
| Modified/LogLink/rand                                                             | 5.24 ± 0.15 μs      |
| Transformed/cumulative/cdf                                                        | 2.73 ± 0.39 μs      |
| Transformed/cumulative/construction                                               | 4.17 ± 0.01 ns      |
| Transformed/cumulative/logpdf                                                     | 1.56 ± 0.34 μs      |
| Transformed/cumulative/rand                                                       | 1.09 ± 0.036 μs     |
| Transformed/thin/cdf                                                              | 2.72 ± 0.39 μs      |
| Transformed/thin/construction                                                     | 3.13 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.55 ± 0.34 μs      |
| Transformed/thin/rand                                                             | 1.09 ± 0.041 μs     |
| Weighted/Product/construction                                                     | 0.332 ± 0.18 μs     |
| Weighted/Product/logpdf                                                           | 2.97 ± 0.28 μs      |
| Weighted/scalar/construction                                                      | 3.13 ± 0.01 ns      |
| Weighted/scalar/logpdf                                                            | 1.65 ± 0.36 μs      |
| time_to_load                                                                      | 0.612 ± 0.0018 s    |

|                                                                                   | 0ef6398da230cf...         |
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
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 0.043 k allocs: 1.86 kB   |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 0.036 k allocs: 1.86 kB   |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 13  allocs: 0.922 kB      |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 0.094 k allocs: 4.89 kB   |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.263 k allocs: 21.5 kB   |
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
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.668 k allocs: 26 kB     |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 2.03 k allocs: 0.0977 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.198 k allocs: 10.1 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 1.65 k allocs: 0.0702 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 8.5 k allocs: 0.854 MB    |
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

