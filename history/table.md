|                                                                                   | 9ca69049314542...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.5 ± 0.12 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.03 ± 0.049 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.748 ± 0.085 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.82 ± 0.15 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18.6 ± 0.92 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.9 ± 0.4 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.77 ± 0.13 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.98 ± 0.051 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.06 ± 0.023 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.8 ± 0.29 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0345 ± 0.0035 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0325 ± 0.00072 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.59 ± 0.1 μs       |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.51 ± 0.069 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.908 ± 0.092 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.57 ± 0.23 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0443 ± 0.0068 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 27.4 ± 0.65 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.4 ± 0.26 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.04 ± 0.29 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.924 ± 0.088 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.31 ± 0.89 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 30.5 ± 4.7 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 17.1 ± 0.54 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.8 ± 0.44 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 15.1 ± 0.33 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.26 ± 0.045 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.3 ± 0.36 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0342 ± 0.0063 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0379 ± 0.0012 ms  |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.1 ± 0.094 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 2.01 ± 0.25 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.53 ± 0.082 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.67 ± 1.2 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 25.1 ± 7.1 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 15.6 ± 0.66 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.14 ± 0.45 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 2.1 ± 0.24 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.535 ± 0.079 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.45 ± 0.31 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.8 ± 7 μs         |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 15.2 ± 0.37 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.37 ± 0.23 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.938 ± 0.072 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.776 ± 0.098 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.6 ± 0.44 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 20.2 ± 0.97 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 19 ± 1.1 μs         |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 8.08 ± 0.075 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.28 ± 0.36 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.573 ± 0.079 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.21 ± 0.83 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 0.0327 ± 0.0069 ms  |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.4 ± 0.43 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 8.07 ± 0.13 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.29 ± 0.32 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.564 ± 0.079 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.11 ± 0.73 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.039 ± 0.007 ms    |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.7 ± 1.2 μs       |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.106 ± 0.0027 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.327 ± 0.029 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0792 ± 0.00073 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.393 ± 0.021 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.22 ± 0.087 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.52 ± 0.32 ms      |
| Affine/LogNormal/ccdf                                                             | 3.29 ± 0.36 μs      |
| Affine/LogNormal/cdf                                                              | 3.37 ± 0.37 μs      |
| Affine/LogNormal/construction                                                     | 3.1 ± 0.01 ns       |
| Affine/LogNormal/logpdf                                                           | 2.66 ± 0.36 μs      |
| Affine/LogNormal/pdf                                                              | 3.81 ± 0.36 μs      |
| Affine/LogNormal/quantile                                                         | 0.493 ± 0.018 μs    |
| Affine/LogNormal/rand                                                             | 1.3 ± 0.078 μs      |
| Baseline/LogNormal/ccdf                                                           | 2.68 ± 0.34 μs      |
| Baseline/LogNormal/cdf                                                            | 2.66 ± 0.35 μs      |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.67 ± 0.31 μs      |
| Baseline/LogNormal/pdf                                                            | 2.98 ± 0.39 μs      |
| Baseline/LogNormal/quantile                                                       | 0.469 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                           | 1.04 ± 0.051 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.51 ± 0.025 μs     |
| Modified/IdentityLink/cdf                                                         | 7.15 ± 0.023 μs     |
| Modified/IdentityLink/construction                                                | 4.02 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.051 μs     |
| Modified/IdentityLink/pdf                                                         | 12.7 ± 0.05 μs      |
| Modified/IdentityLink/quantile                                                    | 0.107 ± 0.00022 ms  |
| Modified/IdentityLink/rand                                                        | 0.558 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.78 ± 0.079 μs     |
| Modified/LogLink/cdf                                                              | 6.13 ± 0.04 μs      |
| Modified/LogLink/construction                                                     | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                           | 8.02 ± 0.037 μs     |
| Modified/LogLink/pdf                                                              | 9.33 ± 0.041 μs     |
| Modified/LogLink/quantile                                                         | 0.929 ± 0.089 μs    |
| Modified/LogLink/rand                                                             | 5.13 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                        | 2.66 ± 0.35 μs      |
| Transformed/cumulative/construction                                               | 2.79 ± 0.001 ns     |
| Transformed/cumulative/logpdf                                                     | 1.68 ± 0.31 μs      |
| Transformed/cumulative/rand                                                       | 1.04 ± 0.057 μs     |
| Transformed/thin/cdf                                                              | 2.66 ± 0.34 μs      |
| Transformed/thin/construction                                                     | 3.1 ± 0.01 ns       |
| Transformed/thin/logpdf                                                           | 1.68 ± 0.3 μs       |
| Transformed/thin/rand                                                             | 1.05 ± 0.055 μs     |
| Weighted/Product/construction                                                     | 0.398 ± 0.18 μs     |
| Weighted/Product/logpdf                                                           | 2.97 ± 0.22 μs      |
| Weighted/scalar/construction                                                      | 3.1 ± 0.01 ns       |
| Weighted/scalar/logpdf                                                            | 1.72 ± 0.32 μs      |
| time_to_load                                                                      | 0.778 ± 0.024 s     |

|                                                                                   | 9ca69049314542...         |
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
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.598 k allocs: 23.4 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 1.97 k allocs: 0.0967 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.173 k allocs: 8.98 kB   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 1.46 k allocs: 0.0622 MB  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 7.9 k allocs: 0.831 MB    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 31.2 k allocs: 1.29 MB    |
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

