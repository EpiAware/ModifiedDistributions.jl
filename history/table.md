|                                                                                   | 4082671ab9d557...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.54 ± 0.1 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.03 ± 0.046 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.747 ± 0.097 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.84 ± 0.25 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18.3 ± 0.69 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.5 ± 0.39 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.76 ± 0.087 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 5.91 ± 1.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.991 ± 0.018 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.3 ± 0.14 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0432 ± 0.0053 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0324 ± 0.00054 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.61 ± 0.08 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.58 ± 0.055 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.898 ± 0.096 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.51 ± 0.14 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0404 ± 0.0043 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 27.4 ± 0.5 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.33 ± 0.15 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.03 ± 0.25 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.877 ± 0.061 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.93 ± 1 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 28.2 ± 2.3 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.8 ± 0.37 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.8 ± 0.17 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.9 ± 0.18 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.25 ± 0.039 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.3 ± 0.34 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0325 ± 0.0047 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0377 ± 0.0007 ms  |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.11 ± 0.078 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.98 ± 0.039 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.529 ± 0.074 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.45 ± 0.27 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 23.7 ± 6.5 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 15 ± 0.34 μs        |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.11 ± 0.08 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.98 ± 0.038 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.521 ± 0.073 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.46 ± 0.26 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.2 ± 7 μs         |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 15 ± 0.33 μs        |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.31 ± 0.094 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.95 ± 0.062 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.787 ± 0.11 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.31 ± 0.2 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19 ± 0.72 μs        |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.3 ± 0.39 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 8.07 ± 0.073 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.28 ± 0.34 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.551 ± 0.075 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.04 ± 0.66 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 29.7 ± 2.8 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.7 ± 0.36 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 8.08 ± 0.073 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.26 ± 0.34 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.556 ± 0.076 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.04 ± 0.68 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0361 ± 0.0033 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.7 ± 0.38 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.111 ± 0.0026 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.326 ± 0.027 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.083 ± 0.00094 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.414 ± 0.022 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.22 ± 0.038 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.28 ± 0.32 ms      |
| Affine/LogNormal/ccdf                                                             | 3.3 ± 0.35 μs       |
| Affine/LogNormal/cdf                                                              | 3.4 ± 0.38 μs       |
| Affine/LogNormal/construction                                                     | 3.41 ± 0.001 ns     |
| Affine/LogNormal/logpdf                                                           | 2.63 ± 0.35 μs      |
| Affine/LogNormal/pdf                                                              | 3.79 ± 0.35 μs      |
| Affine/LogNormal/quantile                                                         | 0.489 ± 0.017 μs    |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.077 μs     |
| Baseline/LogNormal/ccdf                                                           | 2.69 ± 0.33 μs      |
| Baseline/LogNormal/cdf                                                            | 2.64 ± 0.33 μs      |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.66 ± 0.29 μs      |
| Baseline/LogNormal/pdf                                                            | 2.97 ± 0.33 μs      |
| Baseline/LogNormal/quantile                                                       | 0.464 ± 0.017 μs    |
| Baseline/LogNormal/rand                                                           | 1.02 ± 0.028 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.53 ± 0.022 μs     |
| Modified/IdentityLink/cdf                                                         | 7.19 ± 0.025 μs     |
| Modified/IdentityLink/construction                                                | 3.41 ± 0.001 ns     |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.05 μs      |
| Modified/IdentityLink/pdf                                                         | 12.8 ± 0.05 μs      |
| Modified/IdentityLink/quantile                                                    | 0.11 ± 0.00019 ms   |
| Modified/IdentityLink/rand                                                        | 0.579 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.77 ± 0.048 μs     |
| Modified/LogLink/cdf                                                              | 6.15 ± 0.034 μs     |
| Modified/LogLink/construction                                                     | 2.79 ± 0.01 ns      |
| Modified/LogLink/logpdf                                                           | 8.05 ± 0.033 μs     |
| Modified/LogLink/pdf                                                              | 9.33 ± 0.04 μs      |
| Modified/LogLink/quantile                                                         | 0.922 ± 0.068 μs    |
| Modified/LogLink/rand                                                             | 5.14 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                        | 2.65 ± 0.32 μs      |
| Transformed/cumulative/construction                                               | 3.1 ± 0.01 ns       |
| Transformed/cumulative/logpdf                                                     | 1.66 ± 0.29 μs      |
| Transformed/cumulative/rand                                                       | 1.02 ± 0.031 μs     |
| Transformed/thin/cdf                                                              | 2.64 ± 0.32 μs      |
| Transformed/thin/construction                                                     | 2.79 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.3 μs       |
| Transformed/thin/rand                                                             | 1.03 ± 0.03 μs      |
| Weighted/Product/construction                                                     | 0.31 ± 0.1 μs       |
| Weighted/Product/logpdf                                                           | 2.94 ± 0.2 μs       |
| Weighted/scalar/construction                                                      | 4.02 ± 0.01 ns      |
| Weighted/scalar/logpdf                                                            | 1.71 ± 0.29 μs      |
| time_to_load                                                                      | 0.618 ± 0.0064 s    |

|                                                                                   | 4082671ab9d557...         |
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

