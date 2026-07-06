|                                                                                   | 5233a6ca399cfd...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 10.4 ± 0.28 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.98 ± 0.047 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.745 ± 0.095 μs   |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.88 ± 0.18 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18 ± 0.82 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.3 ± 0.44 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.66 ± 0.087 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.96 ± 0.04 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.07 ± 0.015 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.84 ± 0.17 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0345 ± 0.0018 ms |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 31.5 ± 0.57 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.44 ± 0.073 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.47 ± 0.048 μs    |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.909 ± 0.097 μs   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.5 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0494 ± 0.0051 ms |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 26.7 ± 0.52 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.28 ± 0.14 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.01 ± 0.25 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.872 ± 0.059 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.45 ± 1 μs        |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 0.0394 ± 0.0031 ms |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.4 ± 0.45 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.11 ± 0.077 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 2.02 ± 0.042 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.548 ± 0.079 μs   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.6 ± 0.36 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 31.5 ± 8.1 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.7 ± 0.38 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.07 ± 0.08 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.95 ± 0.042 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.545 ± 0.079 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.57 ± 0.36 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 30.7 ± 7.5 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.8 ± 0.4 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 10.1 ± 0.27 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.95 ± 0.071 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.789 ± 0.13 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 8.88 ± 0.24 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19 ± 0.83 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18 ± 0.45 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 8.02 ± 0.073 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.27 ± 0.34 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.609 ± 0.079 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.46 ± 0.54 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 31.2 ± 3.4 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17 ± 0.45 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 8 ± 0.068 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.28 ± 0.31 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.562 ± 0.079 μs   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.26 ± 0.42 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0394 ± 0.0035 ms |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17 ± 0.43 μs       |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.184 ± 0.0084 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.51 ± 0.029 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.125 ± 0.0011 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.585 ± 0.015 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.46 ± 0.038 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 4.2 ± 0.52 ms      |
| Affine/LogNormal/ccdf                                                             | 3.28 ± 0.37 μs     |
| Affine/LogNormal/cdf                                                              | 3.35 ± 0.36 μs     |
| Affine/LogNormal/construction                                                     | 3.1 ± 0.01 ns      |
| Affine/LogNormal/logpdf                                                           | 2.62 ± 0.33 μs     |
| Affine/LogNormal/pdf                                                              | 3.78 ± 0.37 μs     |
| Affine/LogNormal/quantile                                                         | 0.488 ± 0.017 μs   |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.075 μs    |
| Baseline/LogNormal/ccdf                                                           | 2.68 ± 0.32 μs     |
| Baseline/LogNormal/cdf                                                            | 2.67 ± 0.32 μs     |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.01 ns     |
| Baseline/LogNormal/logpdf                                                         | 1.67 ± 0.3 μs      |
| Baseline/LogNormal/pdf                                                            | 2.95 ± 0.33 μs     |
| Baseline/LogNormal/quantile                                                       | 0.473 ± 0.017 μs   |
| Baseline/LogNormal/rand                                                           | 1.02 ± 0.031 μs    |
| Modified/IdentityLink/ccdf                                                        | 7.5 ± 0.02 μs      |
| Modified/IdentityLink/cdf                                                         | 7.13 ± 0.02 μs     |
| Modified/IdentityLink/construction                                                | 3.11 ± 0.01 ns     |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.05 μs     |
| Modified/IdentityLink/pdf                                                         | 12.7 ± 0.051 μs    |
| Modified/IdentityLink/quantile                                                    | 0.107 ± 0.00017 ms |
| Modified/IdentityLink/rand                                                        | 0.558 ± 0.016 ms   |
| Modified/LogLink/ccdf                                                             | 5.79 ± 0.042 μs    |
| Modified/LogLink/cdf                                                              | 6.12 ± 0.024 μs    |
| Modified/LogLink/construction                                                     | 2.79 ± 0.001 ns    |
| Modified/LogLink/logpdf                                                           | 7.98 ± 0.025 μs    |
| Modified/LogLink/pdf                                                              | 9.24 ± 0.039 μs    |
| Modified/LogLink/quantile                                                         | 0.925 ± 0.074 μs   |
| Modified/LogLink/rand                                                             | 5.14 ± 0.14 μs     |
| Transformed/cumulative/cdf                                                        | 2.67 ± 0.34 μs     |
| Transformed/cumulative/construction                                               | 3.72 ± 0.01 ns     |
| Transformed/cumulative/logpdf                                                     | 1.67 ± 0.3 μs      |
| Transformed/cumulative/rand                                                       | 1.02 ± 0.03 μs     |
| Transformed/thin/cdf                                                              | 2.68 ± 0.35 μs     |
| Transformed/thin/construction                                                     | 4.03 ± 0.01 ns     |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.31 μs     |
| Transformed/thin/rand                                                             | 1.02 ± 0.037 μs    |
| Weighted/Product/construction                                                     | 0.292 ± 0.18 μs    |
| Weighted/Product/logpdf                                                           | 2.98 ± 0.21 μs     |
| Weighted/scalar/construction                                                      | 3.1 ± 0.01 ns      |
| Weighted/scalar/logpdf                                                            | 1.73 ± 0.3 μs      |
| time_to_load                                                                      | 0.597 ± 0.0051 s   |

|                                                                                   | 5233a6ca399cfd...         |
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

