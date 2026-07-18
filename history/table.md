|                                                                                   | 8012bfc1f1c6ba...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 6.16 ± 0.55 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.21 ± 0.1 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.503 ± 0.062 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 4.31 ± 0.4 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 12.8 ± 1.1 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 10.7 ± 0.46 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 5.59 ± 0.61 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 3.86 ± 0.19 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.699 ± 0.043 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 5.43 ± 0.26 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 26.9 ± 3.6 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 20.2 ± 0.64 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 5.44 ± 0.46 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 2.32 ± 0.17 μs      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.599 ± 0.044 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 4.88 ± 0.39 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 25.1 ± 3.1 μs       |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 17.1 ± 0.52 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 5.04 ± 0.18 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.681 ± 0.057 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.574 ± 0.074 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 4.98 ± 1.2 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 17.2 ± 1.9 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 10.7 ± 0.45 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 6.5 ± 0.82 μs       |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 4.63 ± 0.13 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.04 ± 0.049 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 7.76 ± 0.28 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 19.6 ± 2.7 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 24.3 ± 0.6 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 5.04 ± 0.48 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.38 ± 0.098 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.356 ± 0.06 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 3.99 ± 0.4 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 15.3 ± 3.3 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 9.44 ± 0.38 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 5.16 ± 0.46 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.36 ± 0.068 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.359 ± 0.061 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 3.49 ± 0.38 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 17 ± 4 μs           |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 9.41 ± 0.36 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 5.02 ± 0.59 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.546 ± 0.043 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.517 ± 0.068 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 4.76 ± 0.6 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 11.9 ± 0.98 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 13 ± 0.51 μs        |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 4.78 ± 0.17 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 0.968 ± 0.044 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.375 ± 0.062 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 4.01 ± 0.53 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 19.2 ± 2.1 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 10.7 ± 0.37 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 4.78 ± 0.25 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 0.963 ± 0.043 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.374 ± 0.076 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 4.03 ± 0.55 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 26.5 ± 2.5 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 10.7 ± 0.38 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0691 ± 0.002 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.204 ± 0.016 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0485 ± 0.00083 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.239 ± 0.016 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 0.839 ± 0.033 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 1.6 ± 0.19 ms       |
| Affine/LogNormal/ccdf                                                             | 2.78 ± 0.24 μs      |
| Affine/LogNormal/cdf                                                              | 2.86 ± 0.24 μs      |
| Affine/LogNormal/construction                                                     | 2.21 ± 0.053 ns     |
| Affine/LogNormal/logpdf                                                           | 1.59 ± 0.21 μs      |
| Affine/LogNormal/pdf                                                              | 2.45 ± 0.23 μs      |
| Affine/LogNormal/quantile                                                         | 0.289 ± 0.0086 μs   |
| Affine/LogNormal/rand                                                             | 1.49 ± 0.22 μs      |
| Baseline/LogNormal/ccdf                                                           | 2.66 ± 0.24 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.24 μs      |
| Baseline/LogNormal/construction                                                   | 0.965 ± 0.003 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.11 ± 0.036 μs     |
| Baseline/LogNormal/pdf                                                            | 2.06 ± 0.22 μs      |
| Baseline/LogNormal/quantile                                                       | 0.248 ± 0.0092 μs   |
| Baseline/LogNormal/rand                                                           | 0.739 ± 0.02 μs     |
| Modified/IdentityLink/ccdf                                                        | 6.09 ± 0.069 μs     |
| Modified/IdentityLink/cdf                                                         | 5.06 ± 0.074 μs     |
| Modified/IdentityLink/construction                                                | 1.86 ± 0.048 ns     |
| Modified/IdentityLink/logpdf                                                      | 8.84 ± 1.2 μs       |
| Modified/IdentityLink/pdf                                                         | 9.15 ± 0.036 μs     |
| Modified/IdentityLink/quantile                                                    | 0.0807 ± 7.9e-05 ms |
| Modified/IdentityLink/rand                                                        | 0.447 ± 0.047 ms    |
| Modified/LogLink/ccdf                                                             | 4.11 ± 0.24 μs      |
| Modified/LogLink/cdf                                                              | 4.03 ± 0.26 μs      |
| Modified/LogLink/construction                                                     | 2.16 ± 0.007 ns     |
| Modified/LogLink/logpdf                                                           | 4.74 ± 0.56 μs      |
| Modified/LogLink/pdf                                                              | 4.88 ± 0.32 μs      |
| Modified/LogLink/quantile                                                         | 0.504 ± 0.012 μs    |
| Modified/LogLink/rand                                                             | 3.15 ± 0.23 μs      |
| Transformed/cumulative/cdf                                                        | 2.65 ± 0.24 μs      |
| Transformed/cumulative/construction                                               | 1.92 ± 0.005 ns     |
| Transformed/cumulative/logpdf                                                     | 1.11 ± 0.041 μs     |
| Transformed/cumulative/rand                                                       | 0.734 ± 0.018 μs    |
| Transformed/thin/cdf                                                              | 2.65 ± 0.24 μs      |
| Transformed/thin/construction                                                     | 1.69 ± 0.007 ns     |
| Transformed/thin/logpdf                                                           | 1.11 ± 0.046 μs     |
| Transformed/thin/rand                                                             | 0.741 ± 0.061 μs    |
| Weighted/Product/construction                                                     | 0.375 ± 0.087 μs    |
| Weighted/Product/logpdf                                                           | 1.79 ± 0.17 μs      |
| Weighted/scalar/construction                                                      | 1.92 ± 0.006 ns     |
| Weighted/scalar/logpdf                                                            | 1.13 ± 0.037 μs     |
| time_to_load                                                                      | 0.455 ± 0.0037 s    |

|                                                                                   | 8012bfc1f1c6ba...         |
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

