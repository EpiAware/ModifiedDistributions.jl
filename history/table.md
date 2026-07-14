|                                                                                   | e90989a47a3e00...   |
|:----------------------------------------------------------------------------------|:-------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 8.03 ± 0.12 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 3.02 ± 0.066 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.817 ± 0.13 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 7.24 ± 0.16 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 18.3 ± 0.98 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 16.5 ± 0.51 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 8.35 ± 0.14 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.97 ± 0.053 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 1.16 ± 0.027 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 9.24 ± 0.26 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 31.3 ± 1.7 μs       |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 0.0319 ± 0.00072 ms |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 8.12 ± 0.12 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.58 ± 0.095 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.987 ± 0.13 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 7.89 ± 0.17 μs      |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0413 ± 0.0046 ms  |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 27.5 ± 0.74 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 8.02 ± 0.33 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 1.08 ± 0.27 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.959 ± 0.075 μs    |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 7.46 ± 1.2 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 26.4 ± 2.4 μs       |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 16.7 ± 0.52 μs      |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 10.2 ± 0.24 μs      |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 15.1 ± 0.25 μs      |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 3.34 ± 0.052 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 13 ± 0.44 μs        |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 31 ± 4.3 μs         |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0361 ± 0.00081 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.64 ± 0.11 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 2 ± 0.05 μs         |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.589 ± 0.093 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.75 ± 0.31 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 25 ± 6.9 μs         |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 15.1 ± 0.42 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 7.63 ± 0.11 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.96 ± 0.046 μs     |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.611 ± 0.091 μs    |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 5.76 ± 0.3 μs       |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 24.6 ± 6.7 μs       |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 15.1 ± 0.44 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.82 ± 0.13 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.974 ± 0.079 μs    |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.848 ± 0.13 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 7.92 ± 0.36 μs      |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 19.2 ± 0.9 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 18.4 ± 0.58 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 7.57 ± 0.1 μs       |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.26 ± 0.42 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.57 ± 0.095 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 6.37 ± 0.34 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 30.5 ± 3 μs         |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 17.5 ± 0.5 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 7.56 ± 0.11 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.26 ± 0.4 μs       |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.583 ± 0.087 μs    |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 6.43 ± 0.34 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 0.0377 ± 0.0032 ms  |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 17.4 ± 0.53 μs      |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.106 ± 0.003 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.309 ± 0.026 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0831 ± 0.00097 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.389 ± 0.015 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 1.09 ± 0.053 ms     |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.53 ± 0.36 ms      |
| Affine/LogNormal/ccdf                                                             | 3.52 ± 0.44 μs      |
| Affine/LogNormal/cdf                                                              | 3.57 ± 0.45 μs      |
| Affine/LogNormal/construction                                                     | 4.52 ± 0.74 ns      |
| Affine/LogNormal/logpdf                                                           | 2.67 ± 0.41 μs      |
| Affine/LogNormal/pdf                                                              | 4.31 ± 0.16 μs      |
| Affine/LogNormal/quantile                                                         | 0.464 ± 0.02 μs     |
| Affine/LogNormal/rand                                                             | 1.27 ± 0.065 μs     |
| Baseline/LogNormal/ccdf                                                           | 2.73 ± 0.4 μs       |
| Baseline/LogNormal/cdf                                                            | 2.72 ± 0.42 μs      |
| Baseline/LogNormal/construction                                                   | 1.74 ± 0.01 ns      |
| Baseline/LogNormal/logpdf                                                         | 1.55 ± 0.35 μs      |
| Baseline/LogNormal/pdf                                                            | 3.36 ± 0.44 μs      |
| Baseline/LogNormal/quantile                                                       | 0.446 ± 0.019 μs    |
| Baseline/LogNormal/rand                                                           | 1.11 ± 0.045 μs     |
| Modified/IdentityLink/ccdf                                                        | 8.51 ± 0.014 μs     |
| Modified/IdentityLink/cdf                                                         | 8.05 ± 0.02 μs      |
| Modified/IdentityLink/construction                                                | 3.49 ± 0.01 ns      |
| Modified/IdentityLink/logpdf                                                      | 11.8 ± 0.05 μs      |
| Modified/IdentityLink/pdf                                                         | 14.4 ± 0.041 μs     |
| Modified/IdentityLink/quantile                                                    | 0.115 ± 0.0001 ms   |
| Modified/IdentityLink/rand                                                        | 0.633 ± 0.017 ms    |
| Modified/LogLink/ccdf                                                             | 6.16 ± 0.046 μs     |
| Modified/LogLink/cdf                                                              | 6.69 ± 0.032 μs     |
| Modified/LogLink/construction                                                     | 3.48 ± 0.001 ns     |
| Modified/LogLink/logpdf                                                           | 7.79 ± 0.033 μs     |
| Modified/LogLink/pdf                                                              | 8.9 ± 0.03 μs       |
| Modified/LogLink/quantile                                                         | 0.879 ± 0.027 μs    |
| Modified/LogLink/rand                                                             | 5.23 ± 0.15 μs      |
| Transformed/cumulative/cdf                                                        | 2.71 ± 0.4 μs       |
| Transformed/cumulative/construction                                               | 3.48 ± 0.001 ns     |
| Transformed/cumulative/logpdf                                                     | 1.55 ± 0.36 μs      |
| Transformed/cumulative/rand                                                       | 1.11 ± 0.046 μs     |
| Transformed/thin/cdf                                                              | 2.72 ± 0.4 μs       |
| Transformed/thin/construction                                                     | 3.48 ± 0.001 ns     |
| Transformed/thin/logpdf                                                           | 1.54 ± 0.36 μs      |
| Transformed/thin/rand                                                             | 1.11 ± 0.032 μs     |
| Weighted/Product/construction                                                     | 0.367 ± 0.15 μs     |
| Weighted/Product/logpdf                                                           | 3.05 ± 0.26 μs      |
| Weighted/scalar/construction                                                      | 4.52 ± 0.009 ns     |
| Weighted/scalar/logpdf                                                            | 1.64 ± 0.35 μs      |
| time_to_load                                                                      | 0.722 ± 0.0088 s    |

