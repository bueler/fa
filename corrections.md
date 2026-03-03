---
layout: course-page
title: Corrections
math: true
---

## Corrections to the Textbook

The following are some corrections to K. Saxe, *Beginning Functional Analysis*, Springer 2010.  Please send me any more you find ([elbueler@alaska.edu](mailto:elbueler@alaska.edu)); we can at least provide the author with a good errata page.

---

**Page 19.**  On this page *equicontinuous at $x \in [a,b]$* is defined correctly for a set $E$.  However, the given definition of "equicontinuous set on an interval" is not the correct hypothesis for Theorem 2.6.  The textbook should say this for the two definitions:

> **Definition.**  Let $E \subset C([a,b])$.  The set $E$ is *equicontinuous at* $x \in [a,b]$ if for any $\epsilon > 0$ there exists a $\delta > 0$ such that $y \in [a,b]$ and $\vert x-y \vert < \delta$ implies $\vert f(x) - f(y) \vert < \epsilon$ for all $f \in E$.  The set $E$ is *uniformly equicontinuous* if for any $\epsilon > 0$ there exists a $\delta > 0$ such that $f \in E$ and $x,y \in [a,b]$ and $\vert x-y \vert < \delta$ imply $\vert f(x) - f(y) \vert < \epsilon$.

From this definition, Theorem 2.6 should say:

> **Theorem 2.6 (The Arzelà-Ascoli Theorem).**  Let $E \subset \big(C([a,b]), \|\cdot\|_\infty\big)$.  Then $E$ is compact if and only if $E$ is closed, bounded, and uniformly equicontinuous on $[a,b]$.

---

**Page 46.**  Here there is a minor omission, namely of a finite-measure assumption.  The author apparently wants to avoid a complicated statement.  However, without an additional hypothesis the textbook's definition can generate $\infty - \infty$ ambiguities.  The textbook should say:

> **Definition.**  Let $E \in \mathcal{M}$.  For a measurable simple function $s(x) = \sum_{k=1}^N c_k \mathbf{1}_{E_k}(x)$, such that $m(E \cap E_k) < \infty$ for each $k$, we define the *Lebesgue integral of $s$ over $E$* by
> $$\int_E s\,dm = \sum_{k=1}^N c_k\, m(E \cap E_k).$$
> If $c_k \ge 0$ for all $k$ then this integral gives a well-defined result in $[0,+\infty]$ even without the finite measure assumption.

---

**Page 67.**  The definition of a *step function* here is not correct, and the proof of Theorem 3.22 should be ignored.  What the textbook says is nearly vacuous, whereas Riesz's result for Euclidean space, namely Theorem 3.22 when corrected, is significant.

> **Definition.**  Suppose $X \subset \mathbb{R}^n$ is an open subset or an interval.  A function $f:X \to \mathbb{C}$, or $f:X \to \mathbb{R}$, is a *step function* if it is a finite linear combination of characteristic functions of intervals,
> $$f(x) = \sum_{k=1}^n c_k \mathbf{1}_{I_k}(x),$$
> with $c_k \in \mathbb{C}$ or $c_k \in \mathbb{R}$, respectively.

The idea is that any $L^p$ function can be approximated by a step function because step functions can approximate characteristic functions of measurable sets, i.e. simple functions.  This is true *if* the norm is an integral norm against Lebesgue measure $m$, which is why there is a $p < \infty$ restriction in the theorem below.

> **Theorem 3.22.**  Suppose $X \subset \mathbb{R}^n$ is an open subset or an interval.  If $1 \le p < \infty$ then the step functions are dense in $L^p(X,m)$.

Note that the density of step functions is *not* automatic for general measure spaces $(X, \mathcal{R}, \mu)$; Theorem 3.22 is for Lebesgue measure.
