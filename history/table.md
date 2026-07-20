|                                                                                   | 2d6c2b200d10be...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.11 ± 0.14 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.98 ± 0.068 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.819 ± 0.13 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 7.15 ± 0.17 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18.1 ± 0.89 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.4 ± 0.48 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.3 ± 0.13 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 6.2 ± 1.4 μs        |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.992 ± 0.026 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.84 ± 0.19 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0432 ± 0.0053 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0317 ± 0.00071 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.15 ± 0.12 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.52 ± 0.079 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.902 ± 0.11 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.98 ± 0.17 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0405 ± 0.0043 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 26.1 ± 0.69 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.04 ± 0.28 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.07 ± 0.25 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.952 ± 0.066 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.34 ± 0.59 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 27.7 ± 1.9 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.6 ± 0.5 μs       |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.3 ± 0.25 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.8 ± 0.25 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.33 ± 0.061 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 13 ± 0.48 μs        |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 31.1 ± 4.5 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0359 ± 0.00079 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.66 ± 0.11 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 2 ± 0.074 μs        |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.531 ± 0.092 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.76 ± 0.3 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 24.6 ± 6.7 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.9 ± 0.44 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.64 ± 0.12 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.99 ± 0.073 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.533 ± 0.089 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.74 ± 0.31 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.8 ± 6.8 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 15 ± 0.46 μs        |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.82 ± 0.12 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.964 ± 0.081 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.832 ± 0.13 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.81 ± 0.24 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19.1 ± 0.96 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.1 ± 0.6 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.58 ± 0.11 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.26 ± 0.42 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.575 ± 0.088 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.45 ± 0.36 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 30.3 ± 3 μs         |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.1 ± 0.47 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.6 ± 0.11 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.25 ± 0.44 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.576 ± 0.087 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.47 ± 0.37 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0377 ± 0.0032 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.1 ± 0.45 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.111 ± 0.0034 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.312 ± 0.027 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0866 ± 0.0011 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.409 ± 0.015 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.16 ± 0.054 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.28 ± 0.36 ms      |
| Affine/LogNormal/ccdf                                                             | 3.51 ± 0.24 μs      |
| Affine/LogNormal/cdf                                                              | 3.58 ± 0.45 μs      |
| Affine/LogNormal/construction                                                     | 3.48 ± 0.001 ns     |
| Affine/LogNormal/logpdf                                                           | 2.67 ± 0.4 μs       |
| Affine/LogNormal/pdf                                                              | 4.23 ± 0.24 μs      |
| Affine/LogNormal/quantile                                                         | 0.906 ± 0.025 μs    |
| Affine/LogNormal/rand                                                             | 1.26 ± 0.064 μs     |
| Baseline/LogNormal/ccdf                                                           | 2.73 ± 0.41 μs      |
| Baseline/LogNormal/cdf                                                            | 2.72 ± 0.43 μs      |
| Baseline/LogNormal/construction                                                   | 1.74 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.55 ± 0.35 μs      |
| Baseline/LogNormal/pdf                                                            | 3.35 ± 0.45 μs      |
| Baseline/LogNormal/quantile                                                       | 0.441 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                           | 1.1 ± 0.039 μs      |
| Modified/IdentityLink/ccdf                                                        | 8.5 ± 0.02 μs       |
| Modified/IdentityLink/cdf                                                         | 8.16 ± 0.037 μs     |
| Modified/IdentityLink/construction                                                | 3.13 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 11.7 ± 0.07 μs      |
| Modified/IdentityLink/pdf                                                         | 14.4 ± 0.051 μs     |
| Modified/IdentityLink/quantile                                                    | 0.118 ± 0.00014 ms  |
| Modified/IdentityLink/rand                                                        | 0.655 ± 0.016 ms    |
| Modified/LogLink/ccdf                                                             | 6.18 ± 0.054 μs     |
| Modified/LogLink/cdf                                                              | 6.7 ± 0.038 μs      |
| Modified/LogLink/construction                                                     | 3.13 ± 0.01 ns      |
| Modified/LogLink/logpdf                                                           | 7.79 ± 0.045 μs     |
| Modified/LogLink/pdf                                                              | 8.87 ± 0.037 μs     |
| Modified/LogLink/quantile                                                         | 0.883 ± 0.067 μs    |
| Modified/LogLink/rand                                                             | 5.24 ± 0.15 μs      |
| Transformed/cumulative/cdf                                                        | 2.72 ± 0.41 μs      |
| Transformed/cumulative/construction                                               | 4.18 ± 0.01 ns      |
| Transformed/cumulative/logpdf                                                     | 1.55 ± 0.36 μs      |
| Transformed/cumulative/rand                                                       | 1.1 ± 0.041 μs      |
| Transformed/thin/cdf                                                              | 2.73 ± 0.4 μs       |
| Transformed/thin/construction                                                     | 3.13 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.55 ± 0.34 μs      |
| Transformed/thin/rand                                                             | 1.1 ± 0.036 μs      |
| Weighted/Product/construction                                                     | 0.407 ± 0.12 μs     |
| Weighted/Product/logpdf                                                           | 3.04 ± 0.23 μs      |
| Weighted/scalar/construction                                                      | 4.17 ± 1 ns         |
| Weighted/scalar/logpdf                                                            | 1.64 ± 0.36 μs      |
| time_to_load                                                                      | 0.632 ± 0.0089 s    |

|                                                                                   | 2d6c2b200d10be...         |
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

