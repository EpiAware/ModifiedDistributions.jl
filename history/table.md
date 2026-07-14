|                                                                                   | 6f94c76b1fd341...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 6.56 ± 0.1 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.53 ± 0.2 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.599 ± 0.039 μs   |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 5.37 ± 0.43 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 13.4 ± 0.98 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 13.8 ± 1.1 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 6.74 ± 0.18 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.34 ± 0.079 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.843 ± 0.045 μs   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 6.7 ± 0.33 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 23.5 ± 1.5 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 25.2 ± 1.7 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 6.6 ± 0.21 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 2.82 ± 0.13 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.697 ± 0.035 μs   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 5.89 ± 0.38 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 29.2 ± 3.5 μs      |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 22.3 ± 1.4 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 6.41 ± 0.31 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.812 ± 0.052 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.665 ± 0.095 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 5.79 ± 1.1 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 20.2 ± 2 μs        |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 13.4 ± 0.81 μs     |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 8.01 ± 0.27 μs     |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 5.7 ± 0.39 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.44 ± 0.055 μs    |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 9.13 ± 0.48 μs     |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 24.1 ± 3.3 μs      |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 30.6 ± 1.4 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 6.19 ± 0.087 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.61 ± 0.077 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.411 ± 0.058 μs   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 4.24 ± 0.46 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 18.2 ± 3.8 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 12.1 ± 0.82 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 6.26 ± 0.092 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.61 ± 0.072 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.417 ± 0.058 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 4.3 ± 0.43 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 17.9 ± 3.7 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 12.2 ± 0.75 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 6.3 ± 0.29 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.653 ± 0.051 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.598 ± 0.039 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 5.8 ± 0.55 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 14.5 ± 1 μs        |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 15.1 ± 1.2 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 6.04 ± 0.3 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.14 ± 0.069 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.453 ± 0.073 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 4.8 ± 0.77 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 22 ± 2.6 μs        |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 13.8 ± 0.86 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 6.07 ± 0.076 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.16 ± 0.082 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.443 ± 0.08 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 4.97 ± 0.63 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 27.1 ± 3 μs        |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 14 ± 0.87 μs       |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0789 ± 0.0031 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.235 ± 0.017 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0569 ± 0.0022 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.272 ± 0.016 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 0.871 ± 0.046 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 1.94 ± 0.15 ms     |
| Affine/LogNormal/ccdf                                                             | 3.53 ± 0.2 μs      |
| Affine/LogNormal/cdf                                                              | 3.58 ± 0.3 μs      |
| Affine/LogNormal/construction                                                     | 2.61 ± 0.018 ns    |
| Affine/LogNormal/logpdf                                                           | 1.81 ± 0.23 μs     |
| Affine/LogNormal/pdf                                                              | 2.99 ± 0.27 μs     |
| Affine/LogNormal/quantile                                                         | 0.306 ± 0.011 μs   |
| Affine/LogNormal/rand                                                             | 1.84 ± 0.24 μs     |
| Baseline/LogNormal/ccdf                                                           | 3.43 ± 0.22 μs     |
| Baseline/LogNormal/cdf                                                            | 3.4 ± 0.28 μs      |
| Baseline/LogNormal/construction                                                   | 1.13 ± 0.031 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.17 ± 0.24 μs     |
| Baseline/LogNormal/pdf                                                            | 2.52 ± 0.25 μs     |
| Baseline/LogNormal/quantile                                                       | 0.297 ± 0.01 μs    |
| Baseline/LogNormal/rand                                                           | 0.804 ± 0.04 μs    |
| Modified/IdentityLink/ccdf                                                        | 6.73 ± 0.19 μs     |
| Modified/IdentityLink/cdf                                                         | 6.73 ± 0.18 μs     |
| Modified/IdentityLink/construction                                                | 2.25 ± 0.065 ns    |
| Modified/IdentityLink/logpdf                                                      | 9.6 ± 0.25 μs      |
| Modified/IdentityLink/pdf                                                         | 11.2 ± 0.13 μs     |
| Modified/IdentityLink/quantile                                                    | 0.0993 ± 0.0028 ms |
| Modified/IdentityLink/rand                                                        | 0.498 ± 0.018 ms   |
| Modified/LogLink/ccdf                                                             | 4.57 ± 0.24 μs     |
| Modified/LogLink/cdf                                                              | 4.84 ± 0.19 μs     |
| Modified/LogLink/construction                                                     | 2.31 ± 0.006 ns    |
| Modified/LogLink/logpdf                                                           | 5.07 ± 0.22 μs     |
| Modified/LogLink/pdf                                                              | 5.98 ± 0.085 μs    |
| Modified/LogLink/quantile                                                         | 0.608 ± 0.021 μs   |
| Modified/LogLink/rand                                                             | 3.82 ± 0.24 μs     |
| Transformed/cumulative/cdf                                                        | 3.42 ± 0.28 μs     |
| Transformed/cumulative/construction                                               | 2.31 ± 0.007 ns    |
| Transformed/cumulative/logpdf                                                     | 1.2 ± 0.21 μs      |
| Transformed/cumulative/rand                                                       | 0.812 ± 0.04 μs    |
| Transformed/thin/cdf                                                              | 3.42 ± 0.19 μs     |
| Transformed/thin/construction                                                     | 2.03 ± 0.006 ns    |
| Transformed/thin/logpdf                                                           | 1.2 ± 0.22 μs      |
| Transformed/thin/rand                                                             | 0.818 ± 0.045 μs   |
| Weighted/Product/construction                                                     | 0.321 ± 0.17 μs    |
| Weighted/Product/logpdf                                                           | 2.02 ± 0.21 μs     |
| Weighted/scalar/construction                                                      | 2.3 ± 0.064 ns     |
| Weighted/scalar/logpdf                                                            | 1.19 ± 0.23 μs     |
| time_to_load                                                                      | 0.644 ± 0.0085 s   |

|                                                                                   | 6f94c76b1fd341...         |
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

