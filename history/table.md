|                                                                                   | c5c064836e4600...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 5.31 ± 0.54 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.01 ± 0.11 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.499 ± 0.042 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 4.31 ± 0.43 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 11.5 ± 1 μs         |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 10.6 ± 0.38 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 5.72 ± 0.52 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 3.89 ± 0.19 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.696 ± 0.023 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 5.55 ± 1.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 26.8 ± 3.5 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 20.8 ± 0.56 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 5.94 ± 0.85 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 2.29 ± 0.072 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.584 ± 0.033 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 4.83 ± 0.4 μs       |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 25.2 ± 2.8 μs       |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 16.9 ± 0.46 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 5.01 ± 0.19 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.673 ± 0.085 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.57 ± 0.045 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 5.02 ± 1.2 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 17.6 ± 1.6 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 10.6 ± 0.39 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 6.48 ± 0.94 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 4.59 ± 0.11 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.05 ± 0.049 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 7.7 ± 0.28 μs       |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 20.7 ± 5.4 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 24.1 ± 0.57 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 5.22 ± 0.53 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.35 ± 0.16 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.361 ± 0.028 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 3.48 ± 0.39 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 15.3 ± 2.9 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 9.44 ± 0.39 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 5.2 ± 0.47 μs       |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.35 ± 0.17 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.36 ± 0.049 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 3.46 ± 0.43 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 15.3 ± 3.2 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 9.64 ± 0.35 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 5 ± 0.55 μs         |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.561 ± 0.058 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.513 ± 0.061 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 4.91 ± 0.63 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 11.9 ± 0.8 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 11.7 ± 0.43 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 5.39 ± 0.8 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 0.997 ± 0.085 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.377 ± 0.076 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 4.23 ± 0.55 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 19.3 ± 2.5 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 10.7 ± 0.38 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 4.97 ± 0.081 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 0.964 ± 0.067 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.403 ± 0.1 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 4.04 ± 0.54 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 23.6 ± 2.2 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 12.3 ± 0.48 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0688 ± 0.0022 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.199 ± 0.017 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0484 ± 0.00067 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.244 ± 0.015 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 0.871 ± 0.076 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 1.56 ± 0.2 ms       |
| Affine/LogNormal/ccdf                                                             | 2.77 ± 0.24 μs      |
| Affine/LogNormal/cdf                                                              | 2.81 ± 0.24 μs      |
| Affine/LogNormal/construction                                                     | 1.92 ± 0.005 ns     |
| Affine/LogNormal/logpdf                                                           | 1.51 ± 0.21 μs      |
| Affine/LogNormal/pdf                                                              | 2.44 ± 0.22 μs      |
| Affine/LogNormal/quantile                                                         | 0.259 ± 0.0051 μs   |
| Affine/LogNormal/rand                                                             | 1.49 ± 0.23 μs      |
| Baseline/LogNormal/ccdf                                                           | 2.65 ± 0.24 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.24 μs      |
| Baseline/LogNormal/construction                                                   | 0.964 ± 0.003 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.11 ± 0.037 μs     |
| Baseline/LogNormal/pdf                                                            | 2.05 ± 0.22 μs      |
| Baseline/LogNormal/quantile                                                       | 0.249 ± 0.0043 μs   |
| Baseline/LogNormal/rand                                                           | 0.736 ± 0.017 μs    |
| Modified/IdentityLink/ccdf                                                        | 6.09 ± 0.15 μs      |
| Modified/IdentityLink/cdf                                                         | 5.07 ± 0.13 μs      |
| Modified/IdentityLink/construction                                                | 2.45 ± 0.009 ns     |
| Modified/IdentityLink/logpdf                                                      | 7.61 ± 0.043 μs     |
| Modified/IdentityLink/pdf                                                         | 10.1 ± 0.05 μs      |
| Modified/IdentityLink/quantile                                                    | 0.0807 ± 0.00011 ms |
| Modified/IdentityLink/rand                                                        | 0.407 ± 0.012 ms    |
| Modified/LogLink/ccdf                                                             | 3.75 ± 0.26 μs      |
| Modified/LogLink/cdf                                                              | 4.02 ± 0.26 μs      |
| Modified/LogLink/construction                                                     | 1.93 ± 0.006 ns     |
| Modified/LogLink/logpdf                                                           | 4.12 ± 0.15 μs      |
| Modified/LogLink/pdf                                                              | 4.85 ± 0.14 μs      |
| Modified/LogLink/quantile                                                         | 0.503 ± 0.011 μs    |
| Modified/LogLink/rand                                                             | 3.14 ± 0.24 μs      |
| Transformed/cumulative/cdf                                                        | 2.65 ± 0.24 μs      |
| Transformed/cumulative/construction                                               | 1.92 ± 0.005 ns     |
| Transformed/cumulative/logpdf                                                     | 1.12 ± 0.047 μs     |
| Transformed/cumulative/rand                                                       | 0.735 ± 0.016 μs    |
| Transformed/thin/cdf                                                              | 2.65 ± 0.24 μs      |
| Transformed/thin/construction                                                     | 1.92 ± 0.006 ns     |
| Transformed/thin/logpdf                                                           | 1.11 ± 0.045 μs     |
| Transformed/thin/rand                                                             | 0.733 ± 0.018 μs    |
| Weighted/Product/construction                                                     | 0.336 ± 0.03 μs     |
| Weighted/Product/logpdf                                                           | 1.78 ± 0.16 μs      |
| Weighted/scalar/construction                                                      | 1.92 ± 0.005 ns     |
| Weighted/scalar/logpdf                                                            | 1.14 ± 0.041 μs     |
| time_to_load                                                                      | 0.437 ± 0.0017 s    |

|                                                                                   | c5c064836e4600...         |
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

