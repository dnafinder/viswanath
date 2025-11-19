[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=dnafinder/viswanath)

📘 Viswanath (Random Fibonacci Sequences)

This repository contains rndfibseq.m, a MATLAB function that simulates random Fibonacci sequences and illustrates the remarkable constant discovered by Divakar Viswanath.
Unlike the classical Fibonacci sequence—whose growth is governed by the golden ratio—the random Fibonacci recurrence grows at an exponential rate governed by the Viswanath constant, approximately 1.13198824.

The function generates the sequence, computes the nth-root growth rates, and produces two visualizations that clearly demonstrate Viswanath’s result.

✨ Features

Generates a random Fibonacci sequence of length N:
t₁ = t₂ = 1, and tₙ = ±tₙ₋₁ ± tₙ₋₂ with independent random signs

Plots:

Semilog plot of |tₙ| compared with y = cⁿ, c ≈ 1.13198824

Plot of |tₙ|^(1/n) compared with the constant reference line y = c

Optional reproducible simulations using a fixed RNG seed

Returns the sequence and nth-root vector (t and z) when requested

Fully documented and cleaned-up MATLAB implementation

🧮 Mathematical Background

For the classical deterministic Fibonacci sequence
f₁ = f₂ = 1, fₙ = fₙ₋₁ + fₙ₋₂,
the growth rate is determined by the golden ratio φ ≈ 1.6180339887.

For the random Fibonacci recurrence, defined by
t₁ = t₂ = 1 and tₙ = ±tₙ₋₁ ± tₙ₋₂,
each “±” chosen independently with probability 1/2,
the behaviour is far less obvious.

The main theorem proved by Viswanath (1999) states that, with probability 1:

  |tₙ|^(1/n) → 1.13198824…

This value is the Viswanath constant, the analogue of the golden ratio for the random recurrence.
The sequence itself grows enormously fast, but in a chaotic, nondeterministic manner.

🚀 Usage (MATLAB)

Typical usage examples:

Standard simulation (N = 5000 terms):
rndfibseq

Shorter simulation:
rndfibseq(1000)

Reproducible run with fixed RNG seed:
[t, z] = rndfibseq(5000, 123)

Outputs:

t — the random Fibonacci sequence

z — nth-root growth estimates, z(n) = |t(n)|^(1/n)

Two plots are produced:

Semilog plot of |tₙ| with reference exponential y = 1.13198824ⁿ

Growth-rate plot of |tₙ|^(1/n) with reference line y = 1.13198824

📚 Reference

Viswanath D.
“Random Fibonacci sequences and the number 1.13198824…”,
Mathematics of Computation, 1999; 69(231):1131–1155.

📄 Citation (for this code)

Cardillo G. (2007). rndfibseq.m – Random Fibonacci sequences: the surprising behaviour of a random Fibonacci sequence.
GitHub: https://github.com/dnafinder/viswanath

🔑 License

See the LICENSE file in this repository.

👤 Author

Giuseppe Cardillo
Email: giuseppe.cardillo.75@gmail.com
