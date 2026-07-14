|                                                                                   | 9762c3bf916cc6...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.37 ± 0.11 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.03 ± 0.077 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.777 ± 0.093 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.76 ± 0.32 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 17.8 ± 0.74 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 15.8 ± 0.39 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.68 ± 0.087 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.96 ± 0.048 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.05 ± 0.018 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 8.64 ± 0.16 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 0.0318 ± 0.0017 ms  |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 31.3 ± 0.58 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.5 ± 0.094 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.5 ± 0.054 μs      |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.898 ± 0.089 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.53 ± 0.15 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0399 ± 0.0041 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 26.7 ± 0.59 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.2 ± 0.15 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.03 ± 0.23 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.863 ± 0.061 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.95 ± 1 μs         |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 27.8 ± 2.6 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16 ± 0.45 μs        |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.6 ± 0.18 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 14.7 ± 0.18 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.28 ± 0.045 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 12.2 ± 0.33 μs      |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 0.0318 ± 0.0054 ms  |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0376 ± 0.00073 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.99 ± 0.078 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.97 ± 0.035 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.527 ± 0.078 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.44 ± 0.27 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 23.8 ± 6.4 μs       |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 14.2 ± 0.37 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.98 ± 0.083 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.94 ± 0.032 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.525 ± 0.077 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.47 ± 0.28 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 23.8 ± 6.5 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 14.4 ± 0.34 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 8.18 ± 0.1 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.941 ± 0.074 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.759 ± 0.099 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.27 ± 0.36 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 18.7 ± 0.79 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 17.6 ± 0.42 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.95 ± 0.075 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.26 ± 0.32 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.585 ± 0.079 μs    |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.98 ± 0.65 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 28.6 ± 2.4 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 16.5 ± 0.36 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.9 ± 0.065 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.27 ± 0.32 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.563 ± 0.081 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.02 ± 0.68 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0353 ± 0.0031 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 16.4 ± 0.42 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.106 ± 0.0026 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.332 ± 0.028 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0799 ± 0.00077 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.387 ± 0.021 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.19 ± 0.054 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.26 ± 0.29 ms      |
| Affine/LogNormal/ccdf                                                             | 3.28 ± 0.37 μs      |
| Affine/LogNormal/cdf                                                              | 3.36 ± 0.35 μs      |
| Affine/LogNormal/construction                                                     | 3.1 ± 0.01 ns       |
| Affine/LogNormal/logpdf                                                           | 2.63 ± 0.34 μs      |
| Affine/LogNormal/pdf                                                              | 3.79 ± 0.37 μs      |
| Affine/LogNormal/quantile                                                         | 0.491 ± 0.017 μs    |
| Affine/LogNormal/rand                                                             | 1.26 ± 0.07 μs      |
| Baseline/LogNormal/ccdf                                                           | 2.66 ± 0.33 μs      |
| Baseline/LogNormal/cdf                                                            | 2.65 ± 0.34 μs      |
| Baseline/LogNormal/construction                                                   | 1.55 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.66 ± 0.3 μs       |
| Baseline/LogNormal/pdf                                                            | 2.96 ± 0.33 μs      |
| Baseline/LogNormal/quantile                                                       | 0.468 ± 0.018 μs    |
| Baseline/LogNormal/rand                                                           | 1.03 ± 0.029 μs     |
| Modified/IdentityLink/ccdf                                                        | 7.5 ± 0.022 μs      |
| Modified/IdentityLink/cdf                                                         | 7.14 ± 0.025 μs     |
| Modified/IdentityLink/construction                                                | 2.79 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 10.5 ± 0.05 μs      |
| Modified/IdentityLink/pdf                                                         | 12.7 ± 0.051 μs     |
| Modified/IdentityLink/quantile                                                    | 0.106 ± 0.0002 ms   |
| Modified/IdentityLink/rand                                                        | 0.557 ± 0.015 ms    |
| Modified/LogLink/ccdf                                                             | 5.78 ± 0.055 μs     |
| Modified/LogLink/cdf                                                              | 6.13 ± 0.032 μs     |
| Modified/LogLink/construction                                                     | 3.1 ± 0.01 ns       |
| Modified/LogLink/logpdf                                                           | 7.98 ± 0.03 μs      |
| Modified/LogLink/pdf                                                              | 9.28 ± 0.049 μs     |
| Modified/LogLink/quantile                                                         | 0.925 ± 0.071 μs    |
| Modified/LogLink/rand                                                             | 5.14 ± 0.14 μs      |
| Transformed/cumulative/cdf                                                        | 2.66 ± 0.31 μs      |
| Transformed/cumulative/construction                                               | 3.1 ± 0.01 ns       |
| Transformed/cumulative/logpdf                                                     | 1.68 ± 0.31 μs      |
| Transformed/cumulative/rand                                                       | 1.03 ± 0.027 μs     |
| Transformed/thin/cdf                                                              | 2.66 ± 0.32 μs      |
| Transformed/thin/construction                                                     | 3.1 ± 0.01 ns       |
| Transformed/thin/logpdf                                                           | 1.66 ± 0.3 μs       |
| Transformed/thin/rand                                                             | 1.02 ± 0.028 μs     |
| Weighted/Product/construction                                                     | 0.355 ± 0.11 μs     |
| Weighted/Product/logpdf                                                           | 2.96 ± 0.21 μs      |
| Weighted/scalar/construction                                                      | 3.1 ± 0.01 ns       |
| Weighted/scalar/logpdf                                                            | 1.72 ± 0.28 μs      |
| time_to_load                                                                      | 0.606 ± 0.014 s     |

