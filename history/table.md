|                                                                                   | e9271dc177fb30...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.48 ± 0.1 μs       |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.02 ± 0.075 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.747 ± 0.093 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.82 ± 0.31 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18.2 ± 0.75 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.7 ± 0.43 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.76 ± 0.084 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 3.03 ± 0.044 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.06 ± 0.024 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.69 ± 0.2 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0318 ± 0.0016 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0321 ± 0.00069 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.58 ± 0.097 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.57 ± 0.09 μs      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.912 ± 0.096 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.47 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.041 ± 0.0041 ms   |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 27.6 ± 0.61 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.45 ± 0.23 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.02 ± 0.24 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.887 ± 0.061 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.99 ± 0.97 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 28.1 ± 2.4 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.6 ± 0.43 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.8 ± 0.15 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.3 ± 0.22 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.26 ± 0.044 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.2 ± 0.4 μs       |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0326 ± 0.0051 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0372 ± 0.0007 ms  |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.17 ± 0.11 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.96 ± 0.032 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.528 ± 0.078 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.42 ± 0.28 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 23.9 ± 6.5 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.9 ± 0.39 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.14 ± 0.09 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 2.01 ± 0.04 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.539 ± 0.078 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.48 ± 0.27 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24 ± 6.7 μs         |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.8 ± 0.41 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.31 ± 0.11 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.954 ± 0.075 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.778 ± 0.097 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.27 ± 0.17 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19.1 ± 1.1 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.5 ± 0.45 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 8.08 ± 0.067 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.28 ± 0.34 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.572 ± 0.078 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.98 ± 0.71 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 29.5 ± 2.6 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.4 ± 0.46 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 8.07 ± 0.08 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.29 ± 0.32 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.572 ± 0.078 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.03 ± 0.77 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0359 ± 0.0033 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.5 ± 0.47 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.106 ± 0.0028 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.33 ± 0.031 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0792 ± 0.00089 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.387 ± 0.02 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.16 ± 0.046 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.38 ± 0.3 ms       |
| Affine/LogNormal/ccdf                                                             | 3.28 ± 0.37 μs      |
| Affine/LogNormal/cdf                                                              | 3.39 ± 0.36 μs      |
| Affine/LogNormal/construction                                                     | 3.41 ± 0.001 ns     |
| Affine/LogNormal/logpdf                                                           | 2.63 ± 0.35 μs      |
| Affine/LogNormal/pdf                                                              | 3.79 ± 0.37 μs      |
| Affine/LogNormal/quantile                                                         | 0.488 ± 0.018 μs    |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.075 μs     |
| Baseline/LogNormal/ccdf                                                           | 2.68 ± 0.34 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.33 μs      |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.001 ns     |
| Baseline/LogNormal/logpdf                                                         | 1.66 ± 0.3 μs       |
| Baseline/LogNormal/pdf                                                            | 2.97 ± 0.33 μs      |
| Baseline/LogNormal/quantile                                                       | 0.467 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                           | 1.03 ± 0.031 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.5 ± 0.02 μs       |
| Modified/IdentityLink/cdf                                                         | 7.13 ± 0.037 μs     |
| Modified/IdentityLink/construction                                                | 3.1 ± 0.01 ns       |
| Modified/IdentityLink/logpdf                                                      | 10.4 ± 0.059 μs     |
| Modified/IdentityLink/pdf                                                         | 12.7 ± 0.05 μs      |
| Modified/IdentityLink/quantile                                                    | 0.107 ± 0.00017 ms  |
| Modified/IdentityLink/rand                                                        | 0.559 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.76 ± 0.05 μs      |
| Modified/LogLink/cdf                                                              | 6.14 ± 0.03 μs      |
| Modified/LogLink/construction                                                     | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                           | 8.01 ± 0.033 μs     |
| Modified/LogLink/pdf                                                              | 9.33 ± 0.031 μs     |
| Modified/LogLink/quantile                                                         | 0.926 ± 0.07 μs     |
| Modified/LogLink/rand                                                             | 5.18 ± 0.2 μs       |
| Transformed/cumulative/cdf                                                        | 2.65 ± 0.33 μs      |
| Transformed/cumulative/construction                                               | 2.79 ± 0.01 ns      |
| Transformed/cumulative/logpdf                                                     | 1.65 ± 0.31 μs      |
| Transformed/cumulative/rand                                                       | 1.03 ± 0.035 μs     |
| Transformed/thin/cdf                                                              | 2.66 ± 0.33 μs      |
| Transformed/thin/construction                                                     | 2.79 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.31 μs      |
| Transformed/thin/rand                                                             | 1.02 ± 0.031 μs     |
| Weighted/Product/construction                                                     | 0.333 ± 0.14 μs     |
| Weighted/Product/logpdf                                                           | 2.95 ± 0.2 μs       |
| Weighted/scalar/construction                                                      | 3.1 ± 0.01 ns       |
| Weighted/scalar/logpdf                                                            | 1.71 ± 0.3 μs       |
| time_to_load                                                                      | 0.605 ± 0.0038 s    |

