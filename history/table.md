|                                                                                   | 18b2116eddf4b7...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 6.32 ± 0.11 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.36 ± 0.085 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.639 ± 0.055 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 5.89 ± 0.47 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 14.3 ± 0.75 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 12.7 ± 0.49 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 6.6 ± 0.1 μs        |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.37 ± 0.082 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.892 ± 0.089 μs    |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 7.34 ± 0.17 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 25.3 ± 1.9 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 24.9 ± 0.66 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 6.44 ± 0.1 μs       |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 2.87 ± 0.12 μs      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.769 ± 0.026 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 6.27 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0325 ± 0.004 ms   |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 21.3 ± 0.62 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 6.36 ± 0.29 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.855 ± 0.12 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.747 ± 0.062 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.16 ± 1.5 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 21.3 ± 2 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 12.9 ± 0.5 μs       |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 8.19 ± 0.17 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 11.9 ± 0.28 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.76 ± 0.071 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 10.5 ± 0.48 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 25.2 ± 3.6 μs       |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 28.3 ± 0.69 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 5.98 ± 0.087 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.58 ± 0.079 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.439 ± 0.078 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 4.6 ± 0.48 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 19.5 ± 3.5 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 11.7 ± 0.42 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 6.01 ± 0.084 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.57 ± 0.075 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.444 ± 0.076 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 4.56 ± 0.48 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 18.9 ± 3.2 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 11.7 ± 0.44 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 6.15 ± 0.11 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.761 ± 0.064 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.651 ± 0.067 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 6.29 ± 0.69 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 15.4 ± 0.98 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 14.1 ± 0.48 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 5.94 ± 0.077 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.29 ± 0.08 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.471 ± 0.083 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.08 ± 0.79 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 23.8 ± 2.6 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 13.3 ± 0.47 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 5.95 ± 0.085 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.28 ± 0.11 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.468 ± 0.085 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 5.25 ± 0.82 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 29.2 ± 2.7 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 13.4 ± 0.61 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0843 ± 0.0025 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.244 ± 0.022 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0645 ± 0.00084 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.303 ± 0.014 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 0.907 ± 0.039 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 1.75 ± 0.27 ms      |
| Affine/LogNormal/ccdf                                                             | 2.77 ± 0.33 μs      |
| Affine/LogNormal/cdf                                                              | 2.81 ± 0.32 μs      |
| Affine/LogNormal/construction                                                     | 2.71 ± 0.01 ns      |
| Affine/LogNormal/logpdf                                                           | 2.08 ± 0.32 μs      |
| Affine/LogNormal/pdf                                                              | 3.3 ± 0.33 μs       |
| Affine/LogNormal/quantile                                                         | 0.362 ± 0.013 μs    |
| Affine/LogNormal/rand                                                             | 0.998 ± 0.042 μs    |
| Baseline/LogNormal/ccdf                                                           | 2.14 ± 0.33 μs      |
| Baseline/LogNormal/cdf                                                            | 2.13 ± 0.3 μs       |
| Baseline/LogNormal/construction                                                   | 1.35 ± 0 ns         |
| Baseline/LogNormal/logpdf                                                         | 1.22 ± 0.29 μs      |
| Baseline/LogNormal/pdf                                                            | 2.62 ± 0.3 μs       |
| Baseline/LogNormal/quantile                                                       | 0.349 ± 0.014 μs    |
| Baseline/LogNormal/rand                                                           | 0.849 ± 0.038 μs    |
| Modified/IdentityLink/ccdf                                                        | 6.57 ± 0.02 μs      |
| Modified/IdentityLink/cdf                                                         | 6.47 ± 0.02 μs      |
| Modified/IdentityLink/construction                                                | 2.71 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 9.25 ± 0.029 μs     |
| Modified/IdentityLink/pdf                                                         | 11.3 ± 0.049 μs     |
| Modified/IdentityLink/quantile                                                    | 0.0926 ± 0.00025 ms |
| Modified/IdentityLink/rand                                                        | 0.468 ± 0.013 ms    |
| Modified/LogLink/ccdf                                                             | 4.87 ± 0.2 μs       |
| Modified/LogLink/cdf                                                              | 5.3 ± 0.053 μs      |
| Modified/LogLink/construction                                                     | 3.25 ± 0.01 ns      |
| Modified/LogLink/logpdf                                                           | 6.13 ± 0.034 μs     |
| Modified/LogLink/pdf                                                              | 6.96 ± 0.03 μs      |
| Modified/LogLink/quantile                                                         | 0.684 ± 0.017 μs    |
| Modified/LogLink/rand                                                             | 4.09 ± 0.32 μs      |
| Transformed/cumulative/cdf                                                        | 2.13 ± 0.3 μs       |
| Transformed/cumulative/construction                                               | 2.44 ± 0.01 ns      |
| Transformed/cumulative/logpdf                                                     | 1.22 ± 0.29 μs      |
| Transformed/cumulative/rand                                                       | 0.845 ± 0.035 μs    |
| Transformed/thin/cdf                                                              | 2.13 ± 0.33 μs      |
| Transformed/thin/construction                                                     | 3.25 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.23 ± 0.29 μs      |
| Transformed/thin/rand                                                             | 0.842 ± 0.037 μs    |
| Weighted/Product/construction                                                     | 0.374 ± 0.12 μs     |
| Weighted/Product/logpdf                                                           | 2.44 ± 0.24 μs      |
| Weighted/scalar/construction                                                      | 2.71 ± 0.01 ns      |
| Weighted/scalar/logpdf                                                            | 1.3 ± 0.3 μs        |
| time_to_load                                                                      | 0.487 ± 0.0046 s    |

|                                                                                   | 18b2116eddf4b7...         |
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

