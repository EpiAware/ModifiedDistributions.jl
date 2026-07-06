|                                                                                   | c5ff0062ac07a5...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.73 ± 0.12 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.04 ± 0.051 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.743 ± 0.1 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 7.03 ± 0.23 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 20 ± 1.1 μs        |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.4 ± 0.47 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.78 ± 0.077 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 3.01 ± 0.076 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.07 ± 0.016 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.7 ± 0.18 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.036 ± 0.0017 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 31.5 ± 0.59 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.6 ± 0.09 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.54 ± 0.086 μs    |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.905 ± 0.094 μs   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.6 ± 0.16 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0477 ± 0.0047 ms |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 26.2 ± 0.59 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.26 ± 0.14 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.02 ± 0.22 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.897 ± 0.068 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.18 ± 0.46 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 0.037 ± 0.003 ms   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.4 ± 0.44 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.03 ± 0.068 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.97 ± 0.061 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.541 ± 0.083 μs   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 6.4 ± 0.61 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 30.8 ± 8.1 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.8 ± 0.43 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.09 ± 0.084 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.97 ± 0.066 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.545 ± 0.081 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 7.7 ± 0.21 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 30 ± 7.7 μs        |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.7 ± 0.4 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.55 ± 0.1 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.954 ± 0.072 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.861 ± 0.14 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.37 ± 0.21 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 20.5 ± 1.2 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.3 ± 0.49 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 8.05 ± 0.075 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.3 ± 0.32 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.591 ± 0.096 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.19 ± 0.76 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 0.0369 ± 0.0033 ms |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 16.8 ± 0.45 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 8.04 ± 0.07 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.25 ± 0.34 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.597 ± 0.091 μs   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.01 ± 0.7 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0446 ± 0.0036 ms |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 16.9 ± 0.47 μs     |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.155 ± 0.0041 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.492 ± 0.033 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.126 ± 0.0013 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.588 ± 0.014 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.52 ± 0.035 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 4.24 ± 0.51 ms     |
| Affine/LogNormal/ccdf                                                             | 3.27 ± 0.38 μs     |
| Affine/LogNormal/cdf                                                              | 3.36 ± 0.37 μs     |
| Affine/LogNormal/construction                                                     | 3.1 ± 0.01 ns      |
| Affine/LogNormal/logpdf                                                           | 2.63 ± 0.35 μs     |
| Affine/LogNormal/pdf                                                              | 3.78 ± 0.2 μs      |
| Affine/LogNormal/quantile                                                         | 0.488 ± 0.017 μs   |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.073 μs    |
| Baseline/LogNormal/ccdf                                                           | 2.66 ± 0.34 μs     |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.34 μs     |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.009 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.67 ± 0.31 μs     |
| Baseline/LogNormal/pdf                                                            | 2.96 ± 0.32 μs     |
| Baseline/LogNormal/quantile                                                       | 0.467 ± 0.017 μs   |
| Baseline/LogNormal/rand                                                           | 1.03 ± 0.03 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.5 ± 0.018 μs     |
| Modified/IdentityLink/cdf                                                         | 7.13 ± 0.02 μs     |
| Modified/IdentityLink/construction                                                | 3.1 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.051 μs    |
| Modified/IdentityLink/pdf                                                         | 12.8 ± 0.05 μs     |
| Modified/IdentityLink/quantile                                                    | 0.107 ± 0.00018 ms |
| Modified/IdentityLink/rand                                                        | 0.559 ± 0.015 ms   |
| Modified/LogLink/ccdf                                                             | 5.76 ± 0.043 μs    |
| Modified/LogLink/cdf                                                              | 6.11 ± 0.026 μs    |
| Modified/LogLink/construction                                                     | 2.79 ± 0.01 ns     |
| Modified/LogLink/logpdf                                                           | 7.99 ± 0.025 μs    |
| Modified/LogLink/pdf                                                              | 9.29 ± 0.04 μs     |
| Modified/LogLink/quantile                                                         | 0.922 ± 0.07 μs    |
| Modified/LogLink/rand                                                             | 5.13 ± 0.14 μs     |
| Transformed/cumulative/cdf                                                        | 2.64 ± 0.32 μs     |
| Transformed/cumulative/construction                                               | 4.02 ± 0.011 ns    |
| Transformed/cumulative/logpdf                                                     | 1.66 ± 0.31 μs     |
| Transformed/cumulative/rand                                                       | 1.04 ± 0.032 μs    |
| Transformed/thin/cdf                                                              | 2.65 ± 0.34 μs     |
| Transformed/thin/construction                                                     | 4.02 ± 0.01 ns     |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.31 μs     |
| Transformed/thin/rand                                                             | 1.04 ± 0.039 μs    |
| Weighted/Product/construction                                                     | 0.305 ± 0.14 μs    |
| Weighted/Product/logpdf                                                           | 2.92 ± 0.21 μs     |
| Weighted/scalar/construction                                                      | 3.41 ± 0.001 ns    |
| Weighted/scalar/logpdf                                                            | 1.73 ± 0.3 μs      |
| time_to_load                                                                      | 0.594 ± 0.0037 s   |

|                                                                                   | c5ff0062ac07a5...         |
|:----------------------------------------------------------------------------------|:-------------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 0.044 k allocs: 1.52 kB   |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 24  allocs: 0.969 kB      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 7  allocs: 0.484 kB       |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 0.07 k allocs: 3.33 kB    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 0.292 k allocs: 13.5 kB   |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 0.248 k allocs: 10.6 kB   |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 0.04 k allocs: 1.25 kB    |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 14  allocs: 0.609 kB      |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 7  allocs: 0.359 kB       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 0.064 k allocs: 3.06 kB   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.455 k allocs: 21.3 kB   |
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
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.556 k allocs: 21.1 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 1.83 k allocs: 0.0805 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.159 k allocs: 8.22 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 1.37 k allocs: 0.0577 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 6.49 k allocs: 1.33 MB    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 0.0531 M allocs: 2.06 MB  |
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

