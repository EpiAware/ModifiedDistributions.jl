|                                                                                   | 06a9b6affccab5...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.47 ± 0.091 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.05 ± 0.082 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.755 ± 0.096 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.79 ± 0.33 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18 ± 0.77 μs        |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 17.9 ± 0.41 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.77 ± 0.097 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 3 ± 0.063 μs        |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.06 ± 0.018 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.62 ± 0.15 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0323 ± 0.0018 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0325 ± 0.00055 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.6 ± 0.093 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.6 ± 0.074 μs      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.904 ± 0.1 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.49 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0423 ± 0.0045 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 28.2 ± 0.54 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.37 ± 0.22 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.03 ± 0.22 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.891 ± 0.067 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.9 ± 1.4 μs        |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 29.3 ± 2.9 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.6 ± 0.44 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.7 ± 0.15 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.4 ± 0.18 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.27 ± 0.039 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.3 ± 0.38 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0333 ± 0.0051 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0373 ± 0.00063 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 8.11 ± 0.087 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.98 ± 0.064 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.548 ± 0.079 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.51 ± 0.3 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 24.6 ± 7.1 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 15 ± 0.4 μs         |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 8.09 ± 0.084 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 2.01 ± 0.063 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.542 ± 0.081 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.5 ± 0.31 μs       |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.3 ± 6.9 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.9 ± 0.37 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.35 ± 0.1 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.949 ± 0.074 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.779 ± 0.099 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.29 ± 0.35 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19.2 ± 1.1 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 20.4 ± 0.46 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 8.09 ± 0.075 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.27 ± 0.33 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.573 ± 0.086 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.05 ± 0.77 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 30.5 ± 2.8 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 18.2 ± 0.49 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 8.04 ± 0.073 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.25 ± 0.33 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.575 ± 0.089 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6 ± 0.79 μs         |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0366 ± 0.0032 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 18.2 ± 0.43 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.105 ± 0.0025 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.329 ± 0.033 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0782 ± 0.00093 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.387 ± 0.022 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.17 ± 0.036 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.28 ± 0.3 ms       |
| Affine/LogNormal/ccdf                                                             | 3.28 ± 0.38 μs      |
| Affine/LogNormal/cdf                                                              | 3.36 ± 0.39 μs      |
| Affine/LogNormal/construction                                                     | 2.79 ± 0.01 ns      |
| Affine/LogNormal/logpdf                                                           | 2.68 ± 0.34 μs      |
| Affine/LogNormal/pdf                                                              | 3.95 ± 0.34 μs      |
| Affine/LogNormal/quantile                                                         | 0.491 ± 0.017 μs    |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.077 μs     |
| Baseline/LogNormal/ccdf                                                           | 2.67 ± 0.34 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.35 μs      |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.66 ± 0.31 μs      |
| Baseline/LogNormal/pdf                                                            | 2.96 ± 0.32 μs      |
| Baseline/LogNormal/quantile                                                       | 0.468 ± 0.017 μs    |
| Baseline/LogNormal/rand                                                           | 1.03 ± 0.032 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.5 ± 0.028 μs      |
| Modified/IdentityLink/cdf                                                         | 7.14 ± 0.023 μs     |
| Modified/IdentityLink/construction                                                | 2.79 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.059 μs     |
| Modified/IdentityLink/pdf                                                         | 12.7 ± 0.051 μs     |
| Modified/IdentityLink/quantile                                                    | 0.107 ± 0.00026 ms  |
| Modified/IdentityLink/rand                                                        | 0.559 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.78 ± 0.04 μs      |
| Modified/LogLink/cdf                                                              | 6.14 ± 0.038 μs     |
| Modified/LogLink/construction                                                     | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                           | 8.02 ± 0.03 μs      |
| Modified/LogLink/pdf                                                              | 9.39 ± 0.031 μs     |
| Modified/LogLink/quantile                                                         | 0.929 ± 0.073 μs    |
| Modified/LogLink/rand                                                             | 5.13 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                        | 2.65 ± 0.33 μs      |
| Transformed/cumulative/construction                                               | 3.1 ± 0.01 ns       |
| Transformed/cumulative/logpdf                                                     | 1.66 ± 0.31 μs      |
| Transformed/cumulative/rand                                                       | 1.03 ± 0.032 μs     |
| Transformed/thin/cdf                                                              | 2.65 ± 0.33 μs      |
| Transformed/thin/construction                                                     | 2.79 ± 0.01 ns      |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.3 μs       |
| Transformed/thin/rand                                                             | 1.03 ± 0.032 μs     |
| Weighted/Product/construction                                                     | 0.36 ± 0.11 μs      |
| Weighted/Product/logpdf                                                           | 2.95 ± 0.22 μs      |
| Weighted/scalar/construction                                                      | 3.1 ± 0.01 ns       |
| Weighted/scalar/logpdf                                                            | 1.72 ± 0.31 μs      |
| time_to_load                                                                      | 0.697 ± 0.00072 s   |

