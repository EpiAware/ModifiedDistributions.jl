|                                                                                   | 27c94843cc7ec4...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.1 ± 0.15 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.99 ± 0.069 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.803 ± 0.14 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 7.1 ± 0.18 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 17.7 ± 0.88 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.3 ± 0.51 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.38 ± 0.14 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 3.06 ± 0.06 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.03 ± 0.025 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 9.23 ± 0.27 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 30.7 ± 1.5 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 31.4 ± 0.68 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.24 ± 0.13 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.59 ± 0.068 μs    |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.953 ± 0.11 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.9 ± 0.16 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0408 ± 0.0048 ms |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 25.8 ± 0.61 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 7.93 ± 0.2 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.06 ± 0.3 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.943 ± 0.072 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.26 ± 1.2 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 26.5 ± 1.9 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.5 ± 0.52 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.68 ± 0.1 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.99 ± 0.047 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.55 ± 0.098 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.65 ± 0.35 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 24.3 ± 6.8 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.8 ± 0.46 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.68 ± 0.11 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.97 ± 0.051 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.562 ± 0.097 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.73 ± 0.33 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.7 ± 7.1 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.8 ± 0.46 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.79 ± 0.13 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.961 ± 0.094 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.839 ± 0.17 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.83 ± 0.32 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 18.8 ± 0.89 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18 ± 0.52 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.61 ± 0.11 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.24 ± 0.42 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.597 ± 0.094 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.23 ± 0.38 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 30.7 ± 3 μs        |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17 ± 0.53 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.63 ± 0.11 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.25 ± 0.41 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.589 ± 0.096 μs   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.3 ± 0.37 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0385 ± 0.0034 ms |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17 ± 0.55 μs       |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.146 ± 0.0031 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.338 ± 0.029 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.13 ± 0.0013 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.571 ± 0.012 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.26 ± 0.035 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 4.2 ± 0.62 ms      |
| Affine/LogNormal/ccdf                                                             | 3.52 ± 0.42 μs     |
| Affine/LogNormal/cdf                                                              | 3.58 ± 0.44 μs     |
| Affine/LogNormal/construction                                                     | 3.48 ± 0.001 ns    |
| Affine/LogNormal/logpdf                                                           | 2.66 ± 0.38 μs     |
| Affine/LogNormal/pdf                                                              | 4.23 ± 0.24 μs     |
| Affine/LogNormal/quantile                                                         | 0.457 ± 0.021 μs   |
| Affine/LogNormal/rand                                                             | 1.25 ± 0.061 μs    |
| Baseline/LogNormal/ccdf                                                           | 2.73 ± 0.4 μs      |
| Baseline/LogNormal/cdf                                                            | 2.72 ± 0.39 μs     |
| Baseline/LogNormal/construction                                                   | 1.74 ± 0.01 ns     |
| Baseline/LogNormal/logpdf                                                         | 1.55 ± 0.36 μs     |
| Baseline/LogNormal/pdf                                                            | 3.35 ± 0.42 μs     |
| Baseline/LogNormal/quantile                                                       | 0.439 ± 0.018 μs   |
| Baseline/LogNormal/rand                                                           | 1.09 ± 0.038 μs    |
| Modified/IdentityLink/ccdf                                                        | 8.49 ± 0.017 μs    |
| Modified/IdentityLink/cdf                                                         | 8.03 ± 0.017 μs    |
| Modified/IdentityLink/construction                                                | 3.48 ± 0.001 ns    |
| Modified/IdentityLink/logpdf                                                      | 11.8 ± 0.05 μs     |
| Modified/IdentityLink/pdf                                                         | 14.4 ± 0.05 μs     |
| Modified/IdentityLink/quantile                                                    | 0.115 ± 0.0001 ms  |
| Modified/IdentityLink/rand                                                        | 0.633 ± 0.016 ms   |
| Modified/LogLink/ccdf                                                             | 6.18 ± 0.052 μs    |
| Modified/LogLink/cdf                                                              | 6.7 ± 0.028 μs     |
| Modified/LogLink/construction                                                     | 4.17 ± 0.01 ns     |
| Modified/LogLink/logpdf                                                           | 7.79 ± 0.04 μs     |
| Modified/LogLink/pdf                                                              | 8.88 ± 0.034 μs    |
| Modified/LogLink/quantile                                                         | 0.878 ± 0.026 μs   |
| Modified/LogLink/rand                                                             | 5.23 ± 0.13 μs     |
| Transformed/cumulative/cdf                                                        | 2.72 ± 0.4 μs      |
| Transformed/cumulative/construction                                               | 3.13 ± 0.01 ns     |
| Transformed/cumulative/logpdf                                                     | 1.55 ± 0.34 μs     |
| Transformed/cumulative/rand                                                       | 1.1 ± 0.067 μs     |
| Transformed/thin/cdf                                                              | 2.72 ± 0.39 μs     |
| Transformed/thin/construction                                                     | 3.48 ± 0.001 ns    |
| Transformed/thin/logpdf                                                           | 1.55 ± 0.37 μs     |
| Transformed/thin/rand                                                             | 1.09 ± 0.041 μs    |
| Weighted/Product/construction                                                     | 0.219 ± 0.25 μs    |
| Weighted/Product/logpdf                                                           | 3.05 ± 0.24 μs     |
| Weighted/scalar/construction                                                      | 3.13 ± 0.01 ns     |
| Weighted/scalar/logpdf                                                            | 1.64 ± 0.36 μs     |
| time_to_load                                                                      | 0.61 ± 0.003 s     |

|                                                                                   | 27c94843cc7ec4...         |
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
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 6.5 k allocs: 1.33 MB     |
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

