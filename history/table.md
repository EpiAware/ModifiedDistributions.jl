|                                                                                   | 52079041b8e967...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.44 ± 0.11 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.04 ± 0.055 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.742 ± 0.083 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.76 ± 0.17 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18 ± 1.1 μs         |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.3 ± 0.43 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.71 ± 0.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 5.85 ± 1.1 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.986 ± 0.019 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.3 ± 0.19 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0434 ± 0.005 ms   |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0325 ± 0.0006 ms  |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.53 ± 0.097 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.55 ± 0.063 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.91 ± 0.093 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.46 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0412 ± 0.0046 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 26.4 ± 0.51 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.29 ± 0.24 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.03 ± 0.25 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.882 ± 0.11 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.05 ± 1.3 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 28.6 ± 2.9 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.7 ± 0.46 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.7 ± 0.17 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.7 ± 0.23 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.26 ± 0.043 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.3 ± 0.44 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0335 ± 0.0051 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0366 ± 0.00057 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.06 ± 0.094 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.98 ± 0.057 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.515 ± 0.077 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.42 ± 0.3 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 24.1 ± 6.8 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 15 ± 0.39 μs        |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.03 ± 0.085 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.98 ± 0.067 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.519 ± 0.075 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.49 ± 0.32 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.3 ± 7.3 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 15 ± 0.36 μs        |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.21 ± 0.1 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.953 ± 0.077 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.775 ± 0.089 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.39 ± 0.39 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 18.9 ± 0.85 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.5 ± 0.47 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.98 ± 0.083 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.27 ± 0.34 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.551 ± 0.076 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.04 ± 0.66 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 29.9 ± 3.1 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.4 ± 0.4 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.96 ± 0.078 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.27 ± 0.32 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.57 ± 0.072 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 5.97 ± 0.66 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.036 ± 0.0034 ms   |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.3 ± 0.41 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.112 ± 0.0029 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.34 ± 0.028 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0837 ± 0.00097 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.414 ± 0.023 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.29 ± 0.076 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.39 ± 0.3 ms       |
| Affine/LogNormal/ccdf                                                             | 3.28 ± 0.36 μs      |
| Affine/LogNormal/cdf                                                              | 3.37 ± 0.38 μs      |
| Affine/LogNormal/construction                                                     | 3.41 ± 0.01 ns      |
| Affine/LogNormal/logpdf                                                           | 2.67 ± 0.34 μs      |
| Affine/LogNormal/pdf                                                              | 3.95 ± 0.33 μs      |
| Affine/LogNormal/quantile                                                         | 0.491 ± 0.017 μs    |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.073 μs     |
| Baseline/LogNormal/ccdf                                                           | 2.67 ± 0.33 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.33 μs      |
| Baseline/LogNormal/construction                                                   | 2.48 ± 0.001 ns     |
| Baseline/LogNormal/logpdf                                                         | 1.66 ± 0.28 μs      |
| Baseline/LogNormal/pdf                                                            | 2.97 ± 0.34 μs      |
| Baseline/LogNormal/quantile                                                       | 0.468 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                           | 1.02 ± 0.029 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.52 ± 0.02 μs      |
| Modified/IdentityLink/cdf                                                         | 7.2 ± 0.025 μs      |
| Modified/IdentityLink/construction                                                | 3.1 ± 0.01 ns       |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.05 μs      |
| Modified/IdentityLink/pdf                                                         | 12.8 ± 0.05 μs      |
| Modified/IdentityLink/quantile                                                    | 0.11 ± 0.00021 ms   |
| Modified/IdentityLink/rand                                                        | 0.578 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.77 ± 0.05 μs      |
| Modified/LogLink/cdf                                                              | 6.14 ± 0.046 μs     |
| Modified/LogLink/construction                                                     | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                           | 8.05 ± 0.03 μs      |
| Modified/LogLink/pdf                                                              | 9.36 ± 0.031 μs     |
| Modified/LogLink/quantile                                                         | 0.924 ± 0.07 μs     |
| Modified/LogLink/rand                                                             | 5.14 ± 0.13 μs      |
| Transformed/cumulative/cdf                                                        | 2.66 ± 0.32 μs      |
| Transformed/cumulative/construction                                               | 4.02 ± 0.01 ns      |
| Transformed/cumulative/logpdf                                                     | 1.67 ± 0.29 μs      |
| Transformed/cumulative/rand                                                       | 1.04 ± 0.031 μs     |
| Transformed/thin/cdf                                                              | 2.67 ± 0.33 μs      |
| Transformed/thin/construction                                                     | 2.79 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.67 ± 0.3 μs       |
| Transformed/thin/rand                                                             | 1.03 ± 0.035 μs     |
| Weighted/Product/construction                                                     | 0.291 ± 0.19 μs     |
| Weighted/Product/logpdf                                                           | 2.99 ± 0.23 μs      |
| Weighted/scalar/construction                                                      | 2.79 ± 0.01 ns      |
| Weighted/scalar/logpdf                                                            | 1.71 ± 0.3 μs       |
| time_to_load                                                                      | 0.601 ± 0.0016 s    |

|                                                                                   | 52079041b8e967...         |
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

