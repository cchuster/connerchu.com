+++
title = 'Singular Value Decomposition'
date = 2024-07-29
draft = false
+++
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

Singular Value Decomposition (SVD) is probably one of the coolest concepts in mathematics I have learned so far. Seen by many as the grand finale of an introductory linear algebra course, SVD combines many pervasive topics seen throughout physics and applied math, including eigenvalues/eigenvectors and unitary matrices. Although SVD was not covered in my introductory mathematical physics course, I tried my best to develop a basic understanding of this factorization tool so that I could comfortably use it when decomposing transient absorption data in my work at the Leone Group.

Note: As a prerequisite to this tidbit, I recommend watching 3Blue1Brown's Essence of Linear Algebra series to gain intuition into how matrices act as linear transformations on some vector space. His visualizations are truly unmatched!

I think its best to begin with eigenvalue decomposition. Suppose we have some arbitrary matrix \(A \in \mathbb{C}^{n \times n}\) with n linearly independent eigenvectors. Eigenvalue decomposition allows you to represent this linear transformation as a composition of 3 other matrices, namely

$$A = Q \Lambda Q^{-1}$$

As is convention in matrix multiplication, we interpret this composition from right to left.  \(Q^{-1}\) is an nxn matrix whose columns contain the original basis written in terms of the eigenvectors of \(A\), \(\Lambda\) is the diagonal matrix containing the eigenvalues of \(A\), and \(Q\) is an nxn matrix whose columns contain the eigenvectors written in terms of the original basis. More eloquently, what this essentially does when applied to some arbitrary vector is first transform the vector space into one represented by the eigenvectors. Then, because eigenvectors are those that solely scale under some linear transformation, our original transformation matrix A is nothing more than a scaling of this eigenvector space. Finally, applying matrix \(Q\) returns us back into the vector space described by our original basis.

Remember that eigenvectors and their corresponding eigenvalues only exist for square matrices because non-square ones encode some dimensionality reduction or extension. How then are we able to generalize this idea to non-square matrices? Enter singular value decomposition.

A quick search online often returns a definition similar to this: Any matrix \(M \in \mathbb{C}^{m \times n}\) can be unconditionally decomposed into three matrices,

$$M = U \Sigma V^{\dagger}$$

where U is an mxm unitary matrix, \(\Sigma\) is an mxn diagonal matrix, and V\(^{\dagger}\) is the conjugate transpose of an nxn unitary matrix. But what do these matrices do, what do they contain, and why?

Well it turns out that there lies a very intuitive interpretation if we just step back and think about how we can find similarities within a dataset in the first place. Naturally, it would make sense that we take the inner product between each combination of columns of our matrix M in order to quantify the orthogonality of each of our data points with respect to one another. \(M^{\dagger}M\) does exactly this by creating a column-wise correlation matrix for M. Equally motivated, we do the same for our rows of M, namely \(MM^{\dagger}\).

Great, we have these column-wise and row-wise correlation matrices for M, but how do we extract the most meaningful information from them? It makes sense then to try finding the eigenvectors and eigenvalues of these matrices.

The diagonal elements of a correlation matrix represents the variance of each variable, while the off-diagonal elements represent the covariance between variables. When applying a correlation matrix onto some vector space, it acts as a linear transformation, stretching or shrinking hyper-dimensional space in each direction depending on whether each pair of dimensions have high or low correlation. Because eigenvectors are those that do not orient and only scale following a transformation, the eigenvectors of a correlation matrix are the principle axis of the data. In other words, they are the directions in which the data has the most variance. We use our column-wise eigenvectors (called the left singular vectors) to form the columns of our matrix \(U\), and the conjugate transpose of our row-wise eigenvectors (called the right singular vectors) to form the columns of \(V^{\dagger}\). Lastly, our diagonal matrix is formed by the square roots of the shared eigenvalues (shared because both are PSD matrices). 

Assuming SVD is true, a simple proof tying all of this together follows.

$$ M^{\dagger}M = V \Sigma U^{\dagger} U \Sigma V^{\dagger} = V \Sigma^2 V^{\dagger} \implies M^{\dagger}M V = V \Sigma^2 $$

$$ MM^{\dagger} = U \Sigma V^{\dagger} V \Sigma U^{\dagger} = U \Sigma^2 U^{\dagger} \implies MM^{\dagger} U = U \Sigma^2 $$

Note: Both U and V are unitary matrices because they are formed by the orthonormal eigenvectors of their respective correlation matrices, and the eigenvectors are orthonormal because the correlation matrices are symmetric.

We see clearly then that our final expressions take the form of the characteristic equation, where \(U\) and \(V\) are the eigenvectors and \(\Sigma^2\) are the eigenvalues.

Throughout my math courses, I have always preferred geometric intuition over any other. However in the case of SVD, I find it most satisfying and complete to see it as a decomposition that captures the dominant correlations between each variable in a dataset. Sure, SVD can be visualized as first a rotation/reflection governed by \(V^{\dagger}\), followed by some scaling factor \(\Sigma\) and dimensionality reducer/extender, followed by a final rotation/reflection governed by \(U\). But I feel this interpretation does not emphasize enough the construction behind these unitary and diagonal matrices. 

In closing, many of these data analysis techniques that we normally abstract away by calling some NumPy function, have far deeper meanings than we would oftentimes expect. I have only barely covered the surface of this topic, and would love to learn more eventually. One of the most important lessons I have learned throughout the past year is to balance and access the opportunity costs of the concepts one dedicates time to understand. If you would like any clarification on these topics, I highly recommend watching [Steve Brunton's series](https://youtube.com/playlist?list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&si=3Inxq5egolTj3Lij) along with [Visual Kernel's video](https://www.youtube.com/watch?v=vSczTbgc8Rc). For those seeking more, I found [this](https://stats.stackexchange.com/questions/2691/making-sense-of-principal-component-analysis-eigenvectors-eigenvalues), [this](https://stats.stackexchange.com/questions/217995/what-is-an-intuitive-explanation-for-how-pca-turns-from-a-geometric-problem-wit), and [this](https://stats.stackexchange.com/questions/10251/what-is-the-objective-function-of-pca/10256#10256) helpful.