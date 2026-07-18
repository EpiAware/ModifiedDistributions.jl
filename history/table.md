|                                                                                   | dc6f3555e474cb...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 7.41 ± 0.38 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.88 ± 0.087 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.667 ± 0.076 μs   |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.14 ± 0.44 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 14.8 ± 1 μs        |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 15.6 ± 1.1 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 7.67 ± 0.42 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 5.32 ± 0.93 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.942 ± 0.078 μs   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 7.52 ± 0.33 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.035 ± 0.0045 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 28.7 ± 1.5 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 7.69 ± 0.25 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.32 ± 0.081 μs    |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.809 ± 0.044 μs   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 6.79 ± 0.29 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0339 ± 0.0037 ms |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 24 ± 1.5 μs        |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 7.23 ± 0.36 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.908 ± 0.062 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.737 ± 0.089 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.54 ± 1.3 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 22.5 ± 2.2 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 15.3 ± 0.6 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 9.04 ± 0.36 μs     |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 6.55 ± 0.26 μs     |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.77 ± 0.11 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 10.7 ± 0.37 μs     |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 26.5 ± 3.3 μs      |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0337 ± 0.0018 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.22 ± 0.12 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.84 ± 0.086 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.462 ± 0.059 μs   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 4.92 ± 0.4 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 20.1 ± 4.8 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 13.5 ± 0.82 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.19 ± 0.25 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.87 ± 0.058 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.459 ± 0.058 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 4.85 ± 0.55 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 20.1 ± 4.8 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 13.6 ± 0.71 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.28 ± 0.25 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.748 ± 0.056 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.683 ± 0.076 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 6.72 ± 0.4 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 16.5 ± 0.99 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 17.2 ± 1.1 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 6.97 ± 0.31 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.29 ± 0.3 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.491 ± 0.065 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.52 ± 0.65 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 24.7 ± 2.8 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 15.5 ± 0.9 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 6.85 ± 0.39 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.27 ± 0.3 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.478 ± 0.054 μs   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 5.44 ± 0.53 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 30.2 ± 2.9 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 15.6 ± 0.77 μs     |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0962 ± 0.0044 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.267 ± 0.022 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0693 ± 0.0026 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.331 ± 0.017 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 0.972 ± 0.053 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.19 ± 0.18 ms     |
| Affine/LogNormal/ccdf                                                             | 4 ± 0.28 μs        |
| Affine/LogNormal/cdf                                                              | 4.15 ± 0.25 μs     |
| Affine/LogNormal/construction                                                     | 2.22 ± 0.09 ns     |
| Affine/LogNormal/logpdf                                                           | 2.08 ± 0.26 μs     |
| Affine/LogNormal/pdf                                                              | 3.37 ± 0.29 μs     |
| Affine/LogNormal/quantile                                                         | 0.34 ± 0.017 μs    |
| Affine/LogNormal/rand                                                             | 2.1 ± 0.31 μs      |
| Baseline/LogNormal/ccdf                                                           | 3.84 ± 0.3 μs      |
| Baseline/LogNormal/cdf                                                            | 3.97 ± 0.32 μs     |
| Baseline/LogNormal/construction                                                   | 1.32 ± 0.044 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.31 ± 0.23 μs     |
| Baseline/LogNormal/pdf                                                            | 2.91 ± 0.26 μs     |
| Baseline/LogNormal/quantile                                                       | 0.33 ± 0.017 μs    |
| Baseline/LogNormal/rand                                                           | 0.937 ± 0.05 μs    |
| Modified/IdentityLink/ccdf                                                        | 7.76 ± 0.43 μs     |
| Modified/IdentityLink/cdf                                                         | 7.31 ± 0.44 μs     |
| Modified/IdentityLink/construction                                                | 2.35 ± 0.073 ns    |
| Modified/IdentityLink/logpdf                                                      | 10.4 ± 0.06 μs     |
| Modified/IdentityLink/pdf                                                         | 13 ± 0.44 μs       |
| Modified/IdentityLink/quantile                                                    | 0.116 ± 0.0074 ms  |
| Modified/IdentityLink/rand                                                        | 0.588 ± 0.029 ms   |
| Modified/LogLink/ccdf                                                             | 5.31 ± 0.26 μs     |
| Modified/LogLink/cdf                                                              | 5.56 ± 0.23 μs     |
| Modified/LogLink/construction                                                     | 2.69 ± 0.004 ns    |
| Modified/LogLink/logpdf                                                           | 5.66 ± 0.24 μs     |
| Modified/LogLink/pdf                                                              | 6.8 ± 0.38 μs      |
| Modified/LogLink/quantile                                                         | 0.992 ± 0.048 μs   |
| Modified/LogLink/rand                                                             | 4.37 ± 0.26 μs     |
| Transformed/cumulative/cdf                                                        | 3.84 ± 0.3 μs      |
| Transformed/cumulative/construction                                               | 2.22 ± 0.069 ns    |
| Transformed/cumulative/logpdf                                                     | 1.33 ± 0.24 μs     |
| Transformed/cumulative/rand                                                       | 0.929 ± 0.051 μs   |
| Transformed/thin/cdf                                                              | 3.97 ± 0.21 μs     |
| Transformed/thin/construction                                                     | 2.69 ± 0.091 ns    |
| Transformed/thin/logpdf                                                           | 1.32 ± 0.24 μs     |
| Transformed/thin/rand                                                             | 0.938 ± 0.053 μs   |
| Weighted/Product/construction                                                     | 0.213 ± 0.14 μs    |
| Weighted/Product/logpdf                                                           | 2.28 ± 0.24 μs     |
| Weighted/scalar/construction                                                      | 2.22 ± 0.072 ns    |
| Weighted/scalar/logpdf                                                            | 1.34 ± 0.25 μs     |
| time_to_load                                                                      | 0.577 ± 0.011 s    |

|                                                                                   | dc6f3555e474cb...         |
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

