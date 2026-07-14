|                                                                                   | f27fd449c5d925...  |
|:----------------------------------------------------------------------------------|:------------------:|
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme forward                   | 7.3 ± 0.27 μs      |
| AD gradients/Affine LogNormal scale+shift logpdf/Enzyme reverse                   | 2.71 ± 0.087 μs    |
| AD gradients/Affine LogNormal scale+shift logpdf/ForwardDiff                      | 0.652 ± 0.072 μs   |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake forward                 | 6.06 ± 0.55 μs     |
| AD gradients/Affine LogNormal scale+shift logpdf/Mooncake reverse                 | 15 ± 1.3 μs        |
| AD gradients/Affine LogNormal scale+shift logpdf/ReverseDiff (tape)               | 15.6 ± 1.1 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme forward               | 7.53 ± 0.3 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Enzyme reverse               | 2.71 ± 0.12 μs     |
| AD gradients/Modified LogNormal identity-link logpdf/ForwardDiff                  | 0.949 ± 0.074 μs   |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake forward             | 7.7 ± 0.31 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/Mooncake reverse             | 26.3 ± 1.6 μs      |
| AD gradients/Modified LogNormal identity-link logpdf/ReverseDiff (tape)           | 29 ± 1.3 μs        |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme forward                    | 7.68 ± 0.098 μs    |
| AD gradients/Modified LogNormal log-link logpdf/Enzyme reverse                    | 3.22 ± 0.18 μs     |
| AD gradients/Modified LogNormal log-link logpdf/ForwardDiff                       | 0.799 ± 0.051 μs   |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake forward                  | 6.62 ± 0.38 μs     |
| AD gradients/Modified LogNormal log-link logpdf/Mooncake reverse                  | 0.0335 ± 0.0034 ms |
| AD gradients/Modified LogNormal log-link logpdf/ReverseDiff (tape)                | 24.6 ± 1.7 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme forward             | 7.38 ± 0.33 μs     |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Enzyme reverse             | 0.916 ± 0.068 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ForwardDiff                | 0.737 ± 0.092 μs   |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake forward           | 6.63 ± 1.2 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/Mooncake reverse           | 22.3 ± 2.1 μs      |
| AD gradients/Product{Weighted} LogNormal vector logpdf/ReverseDiff (tape)         | 15.3 ± 0.72 μs     |
| AD gradients/Thinned convolved series sum/Enzyme forward                          | 9.03 ± 0.51 μs     |
| AD gradients/Thinned convolved series sum/Enzyme reverse                          | 6.46 ± 0.29 μs     |
| AD gradients/Thinned convolved series sum/ForwardDiff                             | 2.77 ± 0.14 μs     |
| AD gradients/Thinned convolved series sum/Mooncake forward                        | 10.6 ± 0.65 μs     |
| AD gradients/Thinned convolved series sum/Mooncake reverse                        | 26.8 ± 3.3 μs      |
| AD gradients/Thinned convolved series sum/ReverseDiff (tape)                      | 0.0347 ± 0.0017 ms |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme forward               | 7.06 ± 0.28 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Enzyme reverse               | 1.86 ± 0.098 μs    |
| AD gradients/Transformed cumulative LogNormal logpdf/ForwardDiff                  | 0.473 ± 0.061 μs   |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake forward             | 5.02 ± 0.39 μs     |
| AD gradients/Transformed cumulative LogNormal logpdf/Mooncake reverse             | 19.8 ± 4.2 μs      |
| AD gradients/Transformed cumulative LogNormal logpdf/ReverseDiff (tape)           | 13.8 ± 0.65 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme forward                     | 6.84 ± 0.21 μs     |
| AD gradients/Transformed thin LogNormal logpdf/Enzyme reverse                     | 1.82 ± 0.095 μs    |
| AD gradients/Transformed thin LogNormal logpdf/ForwardDiff                        | 0.459 ± 0.061 μs   |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake forward                   | 4.85 ± 0.5 μs      |
| AD gradients/Transformed thin LogNormal logpdf/Mooncake reverse                   | 19.5 ± 4.2 μs      |
| AD gradients/Transformed thin LogNormal logpdf/ReverseDiff (tape)                 | 13.3 ± 0.84 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme forward               | 7.26 ± 0.24 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Enzyme reverse               | 0.738 ± 0.055 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/ForwardDiff                  | 0.679 ± 0.074 μs   |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake forward             | 6.62 ± 0.49 μs     |
| AD gradients/Weighted Affine LogNormal nested logpdf/Mooncake reverse             | 16 ± 0.96 μs       |
| AD gradients/Weighted Affine LogNormal nested logpdf/ReverseDiff (tape)           | 16.6 ± 1.1 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme forward     | 6.72 ± 0.23 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Enzyme reverse     | 1.23 ± 0.28 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ForwardDiff        | 0.482 ± 0.057 μs   |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake forward   | 5.37 ± 0.53 μs     |
| AD gradients/Weighted LogNormal observation-time weight logpdf/Mooncake reverse   | 24.2 ± 2.6 μs      |
| AD gradients/Weighted LogNormal observation-time weight logpdf/ReverseDiff (tape) | 15.4 ± 0.96 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme forward                      | 6.91 ± 0.31 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Enzyme reverse                      | 1.24 ± 0.27 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/ForwardDiff                         | 0.486 ± 0.066 μs   |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake forward                    | 5.51 ± 0.63 μs     |
| AD gradients/Weighted LogNormal scalar logpdf/Mooncake reverse                    | 29.8 ± 2.8 μs      |
| AD gradients/Weighted LogNormal scalar logpdf/ReverseDiff (tape)                  | 15.2 ± 0.91 μs     |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme forward             | 0.0891 ± 0.0042 ms |
| AD gradients/Weighted Sequential observed-total logpdf/Enzyme reverse             | 0.259 ± 0.02 ms    |
| AD gradients/Weighted Sequential observed-total logpdf/ForwardDiff                | 0.0641 ± 0.003 ms  |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake forward           | 0.299 ± 0.014 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/Mooncake reverse           | 0.949 ± 0.059 ms   |
| AD gradients/Weighted Sequential observed-total logpdf/ReverseDiff (tape)         | 2.15 ± 0.17 ms     |
| Affine/LogNormal/ccdf                                                             | 4.13 ± 0.3 μs      |
| Affine/LogNormal/cdf                                                              | 4.18 ± 0.31 μs     |
| Affine/LogNormal/construction                                                     | 3.35 ± 0.012 ns    |
| Affine/LogNormal/logpdf                                                           | 2.11 ± 0.22 μs     |
| Affine/LogNormal/pdf                                                              | 3.5 ± 0.3 μs       |
| Affine/LogNormal/quantile                                                         | 0.354 ± 0.018 μs   |
| Affine/LogNormal/rand                                                             | 2.14 ± 0.27 μs     |
| Baseline/LogNormal/ccdf                                                           | 3.97 ± 0.21 μs     |
| Baseline/LogNormal/cdf                                                            | 3.99 ± 0.2 μs      |
| Baseline/LogNormal/construction                                                   | 1.95 ± 0.065 ns    |
| Baseline/LogNormal/logpdf                                                         | 1.34 ± 0.27 μs     |
| Baseline/LogNormal/pdf                                                            | 2.91 ± 0.22 μs     |
| Baseline/LogNormal/quantile                                                       | 0.338 ± 0.018 μs   |
| Baseline/LogNormal/rand                                                           | 0.923 ± 0.047 μs   |
| Modified/IdentityLink/ccdf                                                        | 7.85 ± 0.26 μs     |
| Modified/IdentityLink/cdf                                                         | 7.61 ± 0.48 μs     |
| Modified/IdentityLink/construction                                                | 3.35 ± 0.11 ns     |
| Modified/IdentityLink/logpdf                                                      | 11.2 ± 0.37 μs     |
| Modified/IdentityLink/pdf                                                         | 13 ± 0.82 μs       |
| Modified/IdentityLink/quantile                                                    | 0.112 ± 0.0039 ms  |
| Modified/IdentityLink/rand                                                        | 0.576 ± 0.026 ms   |
| Modified/LogLink/ccdf                                                             | 5.33 ± 0.19 μs     |
| Modified/LogLink/cdf                                                              | 5.79 ± 0.072 μs    |
| Modified/LogLink/construction                                                     | 3.36 ± 0.01 ns     |
| Modified/LogLink/logpdf                                                           | 5.94 ± 0.069 μs    |
| Modified/LogLink/pdf                                                              | 6.96 ± 0.24 μs     |
| Modified/LogLink/quantile                                                         | 0.706 ± 0.016 μs   |
| Modified/LogLink/rand                                                             | 4.44 ± 0.21 μs     |
| Transformed/cumulative/cdf                                                        | 3.99 ± 0.32 μs     |
| Transformed/cumulative/construction                                               | 3.37 ± 0.02 ns     |
| Transformed/cumulative/logpdf                                                     | 1.33 ± 0.27 μs     |
| Transformed/cumulative/rand                                                       | 0.913 ± 0.049 μs   |
| Transformed/thin/cdf                                                              | 3.9 ± 0.22 μs      |
| Transformed/thin/construction                                                     | 3.26 ± 0.1 ns      |
| Transformed/thin/logpdf                                                           | 1.31 ± 0.3 μs      |
| Transformed/thin/rand                                                             | 0.923 ± 0.052 μs   |
| Weighted/Product/construction                                                     | 0.349 ± 0.13 μs    |
| Weighted/Product/logpdf                                                           | 2.3 ± 0.22 μs      |
| Weighted/scalar/construction                                                      | 3.03 ± 0.026 ns    |
| Weighted/scalar/logpdf                                                            | 1.38 ± 0.25 μs     |
| time_to_load                                                                      | 0.741 ± 0.005 s    |

