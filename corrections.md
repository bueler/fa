---
layout: course-page
title: Corrections
math: true
---

## Corrections to the Textbook

The following are some corrections to K. Saxe, *Beginning Functional Analysis*, Springer 2010.  Please send me any more you find ([elbueler@alaska.edu](mailto:elbueler@alaska.edu)); we can at least provide the author with a good errata page.


<!-- notes for typing MathJax:
  * use $\vert x \vert$ instead of $|x|$
  * use $\lbrace x \rbrace$ instead of ${x\}$
  * $\left\vert ... \right\vert$ also works
  * for norm symbols ||.|| do $\\|\cdot\\|$
  * insert a blank line before and after displayed equations
/-->

---

**Page 19.**  On this page *equicontinuous at $x \in [a,b]$* is defined correctly for a set $E$.  However, the given definition of "equicontinuous set on an interval" is not the correct hypothesis for Theorem 2.6.  The textbook should say this for the two definitions:

> **Definition.**  Let $E \subset C([a,b])$.  The set $E$ is *equicontinuous at* $x \in [a,b]$ if for any $\epsilon > 0$ there exists a $\delta > 0$ such that $y \in [a,b]$ and $\vert x-y \vert < \delta$ implies $\vert f(x) - f(y) \vert < \epsilon$ for all $f \in E$.  The set $E$ is *uniformly equicontinuous* if for any $\epsilon > 0$ there exists a $\delta > 0$ such that $f \in E$ and $x,y \in [a,b]$ and $\vert x-y \vert < \delta$ imply $\vert f(x) - f(y) \vert < \epsilon$.

From this definition, Theorem 2.6 should say:

> **Theorem 2.6 (The Arzelà-Ascoli Theorem).**  Let $E \subset \big(C([a,b]), \\|\cdot\\|_\infty\big)$.  Then $E$ is compact if and only if $E$ is closed, bounded, and uniformly equicontinuous on $[a,b]$.

---

**Page 46.**  Here there is a minor omission, namely of a finite-measure assumption.  The author apparently wants to avoid a complicated statement.  However, without an additional hypothesis the textbook's definition can generate $\infty - \infty$ ambiguities.  As one correct possibility the textbook might say:

> **Definition.**  Let $E \in \mathcal{M}$.  For a measurable simple function $s(x) = \sum_{k=1}^N c_k \mathbf{1}_{E_k}(x)$, such that $m(E \cap E_k) < \infty$ for each $k$, we define the *Lebesgue integral of $s$ over $E$* by
>
> $$\int_E s\,dm = \sum_{k=1}^N c_k\, m(E \cap E_k).$$

If $c_k \ge 0$ for all $k$ then this integral gives a well-defined result in $[0,+\infty]$ even without the finite measure assumption.

---

**Page 50.**  Unfortunately, the statement of Lebesgue's Monotone Convergence Theorem, which is Theorem 3.13, is not correct.  To make the statement match the proof, one must add an assumption that the set of integrals $\left\lbrace\int_A f_k\,dm\right\rbrace$ is bounded.  Thus:

> **Theorem 3.13.**  Suppose that $A\in \mathcal{M}$ and that $\lbrace f_k\rbrace_{k=1}^\infty$ is a sequence of measurable functions such that
>  $$0 \le f_1(x) \le f_2(x) \le \cdots \quad \text{for almost all } x\in \mathcal{A}.$$
> Suppose that $\lbrace\int_A f_k\,dm\rbrace_{k=1}^\infty$ is a bounded set of (nonnegative) real numbers.  Let $f$ be defined to be the pointwise limit, $f(x) = \lim_{k\to\infty} f_k(x)$, of this sequence.  Then $f$ is integrable and
>
>  $$\lim_{k\to\infty} \left(\int_A f_k\,dm\right) = \int_A f\,dm.$$

The proof, as stated in the textbook, is wrong to assert that the given hypotheses imply that this set is bounded, because without the boundedness assumption the integral of $f$ could be infinite.  (In that case it would be well-defined as $+\infty$, but $f$ would not be integrable.)  But with the added boundedness assumption the book's proof is correct as far as I can tell.

---

**Page 67.**  The definition of a *step function* here is not correct, and the proof of Theorem 3.22 should be ignored.  What the textbook says is nearly vacuous, whereas Riesz's result for Euclidean space, namely Theorem 3.22 when corrected, is significant.

> **Definition.**  Suppose $X \subset \mathbb{R}^n$ is an open subset or an interval.  A function $f:X \to \mathbb{C}$, or $f:X \to \mathbb{R}$, is a *step function* if it is a finite linear combination of characteristic functions of intervals,
>
> $$f(x) = \sum_{k=1}^n c_k \mathbf{1}_{I_k}(x),$$
>
> with $c_k \in \mathbb{C}$ or $c_k \in \mathbb{R}$, respectively.

The idea is that any $L^p$ function can be approximated by a step function because step functions can approximate characteristic functions of measurable sets, i.e. simple functions.  This is true *if* the norm is an *integral* norm, not a supremum norm, which is why there is a $p < \infty$ restriction in the theorem below.

> **Theorem 3.22.**  Suppose $X \subset \mathbb{R}^n$ is an open subset or an interval.  If $1 \le p < \infty$ then the step functions are dense in $L^p(X,m)$.

Note that the density of step functions is *not* automatic for general measure spaces $(X, \mathcal{R}, \mu)$; Theorem 3.22 is for Lebesgue measure.

An apparently correct proof can be found [here](https://faculty.etsu.edu/gardnerr/5210/Beamer-Proofs/Proofs-7-4-print.pdf), based on the key fact that every measurable set $E$ with $m(E)<\infty$ can be approximated in measure by a *finite* collection of open intervals.
