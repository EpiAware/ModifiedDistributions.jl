|                                                                                   | c50e941399b784...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.38 ± 0.11 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.02 ± 0.073 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.742 ± 0.086 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.76 ± 0.29 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 17.9 ± 0.8 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.5 ± 0.45 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.67 ± 0.097 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 5.85 ± 1.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.989 ± 0.022 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.21 ± 0.18 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0433 ± 0.0056 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0326 ± 0.0006 ms  |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.5 ± 0.08 μs       |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.51 ± 0.061 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.906 ± 0.089 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.47 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0403 ± 0.0041 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 27 ± 0.59 μs        |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.29 ± 0.19 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.03 ± 0.27 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.871 ± 0.058 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.86 ± 1 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 28 ± 2.4 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.4 ± 0.39 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.6 ± 0.17 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.6 ± 0.28 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.26 ± 0.051 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.3 ± 0.43 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0339 ± 0.0053 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0371 ± 0.00066 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.04 ± 0.09 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.95 ± 0.042 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.512 ± 0.075 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.51 ± 0.26 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 24 ± 6.7 μs         |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.9 ± 0.43 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.02 ± 0.081 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.95 ± 0.043 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.508 ± 0.074 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.5 ± 0.29 μs       |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24 ± 6.7 μs         |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.8 ± 0.42 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.18 ± 0.11 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.937 ± 0.058 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.778 ± 0.089 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.19 ± 0.15 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19.4 ± 0.87 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.2 ± 0.45 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.97 ± 0.08 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.28 ± 0.33 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.545 ± 0.069 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.94 ± 0.7 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 29.4 ± 2.9 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 16.9 ± 0.48 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.97 ± 0.083 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.28 ± 0.32 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.539 ± 0.074 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 5.97 ± 0.62 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0359 ± 0.0034 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17 ± 0.43 μs        |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.112 ± 0.0026 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.346 ± 0.027 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0841 ± 0.00094 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.411 ± 0.022 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.22 ± 0.07 ms      |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.37 ± 0.3 ms       |
| Affine/LogNormal/ccdf                                                             | 3.28 ± 0.37 μs      |
| Affine/LogNormal/cdf                                                              | 3.36 ± 0.36 μs      |
| Affine/LogNormal/construction                                                     | 3.1 ± 0.01 ns       |
| Affine/LogNormal/logpdf                                                           | 2.64 ± 0.34 μs      |
| Affine/LogNormal/pdf                                                              | 3.79 ± 0.36 μs      |
| Affine/LogNormal/quantile                                                         | 0.493 ± 0.017 μs    |
| Affine/LogNormal/rand                                                             | 1.26 ± 0.07 μs      |
| Baseline/LogNormal/ccdf                                                           | 2.66 ± 0.33 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.34 μs      |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.66 ± 0.29 μs      |
| Baseline/LogNormal/pdf                                                            | 2.97 ± 0.32 μs      |
| Baseline/LogNormal/quantile                                                       | 0.467 ± 0.017 μs    |
| Baseline/LogNormal/rand                                                           | 1.02 ± 0.032 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.53 ± 0.025 μs     |
| Modified/IdentityLink/cdf                                                         | 7.2 ± 0.03 μs       |
| Modified/IdentityLink/construction                                                | 3.41 ± 0.001 ns     |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.051 μs     |
| Modified/IdentityLink/pdf                                                         | 12.7 ± 0.06 μs      |
| Modified/IdentityLink/quantile                                                    | 0.111 ± 0.00017 ms  |
| Modified/IdentityLink/rand                                                        | 0.576 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.77 ± 0.047 μs     |
| Modified/LogLink/cdf                                                              | 6.15 ± 0.032 μs     |
| Modified/LogLink/construction                                                     | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                           | 8 ± 0.033 μs        |
| Modified/LogLink/pdf                                                              | 9.27 ± 0.041 μs     |
| Modified/LogLink/quantile                                                         | 0.922 ± 0.069 μs    |
| Modified/LogLink/rand                                                             | 5.13 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                        | 2.65 ± 0.34 μs      |
| Transformed/cumulative/construction                                               | 4.02 ± 0.93 ns      |
| Transformed/cumulative/logpdf                                                     | 1.66 ± 0.28 μs      |
| Transformed/cumulative/rand                                                       | 1.02 ± 0.033 μs     |
| Transformed/thin/cdf                                                              | 2.65 ± 0.32 μs      |
| Transformed/thin/construction                                                     | 2.79 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.3 μs       |
| Transformed/thin/rand                                                             | 1.02 ± 0.033 μs     |
| Weighted/Product/construction                                                     | 0.312 ± 0.11 μs     |
| Weighted/Product/logpdf                                                           | 2.93 ± 0.2 μs       |
| Weighted/scalar/construction                                                      | 4.02 ± 0.011 ns     |
| Weighted/scalar/logpdf                                                            | 1.72 ± 0.29 μs      |
| time_to_load                                                                      | 0.619 ± 0.013 s     |

|                                                                                   | c50e941399b784...         |
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

