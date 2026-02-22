// Main report file
#import "template.typ": make-report, report-footnote
#import "metadata.typ": my-report
#import "@preview/theofig:0.1.0": definition

// Main content
#show: make-report.with(my-report)

#v(1em)

= Exercise 1
#h(1em)
Let $|psi chevron.r = (|0 chevron.r + |1 chevron.r ) / sqrt(2)$. Write out $|psi chevron.r^(times.o 2)$ and $|psi chevron.r^(times.o 3)$ explicitly, both in terms of tensor products like $|0 chevron.r |1 chevron.r$, and using the Kronecker product.

- As we often use the abbreviated notations $|v chevron.r times.o |w chevron.r = |v w chevron.r$ for the tensor product, we have in term of tensor products:
#align(
  left,
  $
    |psi chevron.r^(times.o 2) &= |psi chevron.r times.o |psi chevron.r \
    &= (|0 chevron.r + |1 chevron.r )/ sqrt(2) times.o (|0 chevron.r + |1 chevron.r)/sqrt(2) \
    &= 1/sqrt(2) dot 1/sqrt(2) (|0 chevron.r times.o |0 chevron.r + |0 chevron.r times.o |1 chevron.r + |1 chevron.r times.o |0 chevron.r + |1 chevron.r times.o |1 chevron.r)^#report-footnote("Distributivity of tensorial product") \
    &= (|00 chevron.r + |01 chevron.r + |10 chevron.r + |11 chevron.r)/2
  $,
)

- As $|0 chevron.r = vec(1, 0)$ and $|1 chevron.r = vec(0, 1)$, we have by using the Kronecker#report-footnote([Kronecker product: Given vectors $bold(a) in CC^(m)$ and $bold(b) in CC^(n)$,
    their Kronecker product is defined as:
    $bold(a) times.o bold(b) = (a_1 bold(b), a_2 bold(b), dots, a_m bold(b))^T in CC^(m n)$]) product:

#align(
  left,
  $
    |psi chevron.r^(times.o 2) & = |psi chevron.r times.o |psi chevron.r \
                               & = 1/sqrt(2) (vec(1, 0) + vec(0, 1)) times.o 1/sqrt(2) (vec(1, 0) + vec(0, 1)) \
                               & = 1/2 vec(1, 1) times.o vec(1, 1) \
                               & = 1/2 vec(1, 1, 1, 1)
  $,
)

- For $|psi chevron.r^(times.o 3)$, we have in term of tensor products:
#align(
  left,
  $
    |psi chevron.r^(times.o 3) &= |psi chevron.r times.o |psi chevron.r^(times.o 2)\
    &= (|0 chevron.r + |1 chevron.r)/sqrt(2) times.o (|00 chevron.r + |01 chevron.r + |10 chevron.r + |11 chevron.r)/2\
    &= 1/(2sqrt(2))(|0 chevron.r times.o (|00 chevron.r + |01 chevron.r + |10 chevron.r + |11 chevron.r) + |1 chevron.r times.o (|00 chevron.r + |01 chevron.r + |10 chevron.r + |11 chevron.r) \
    &= 1/(2sqrt(2))(|000 chevron.r + |001 chevron.r + |010 chevron.r + |011 chevron.r + |100 chevron.r + |101 chevron.r + |110 chevron.r + |111 chevron.r) \
  $,
)

#pagebreak()

- And by using the Kronecker product:

#align(
  left,
  $
    |psi chevron.r^(times.o 3) & = |psi chevron.r times.o |psi chevron.r^(times.o 2) \
                               & = 1/sqrt(2)(vec(1, 0) + vec(0, 1)) times.o 1/2vec(1, 1, 1, 1) \
                               & = 1/(2 sqrt(2))(vec(1, 1) times.o vec(1, 1, 1, 1)) = vec(1, 1, 1, 1, 1, 1, 1, 1) \
  $,
)


#v(1em)

= Exercise 2
#h(1em)
The Hadamard operator on one qubit may be written as

$
  H = 1/sqrt(2) [(|0 chevron.r + |1 chevron.r )chevron 0| + (|0 chevron.r - |1 chevron.r )chevron 1| ].
$

Show explicitly that the Hadamard transform on $n$ qubits, $H^(times.o n)$, may be written as

$
  H^(times.o n) = 1/sqrt(2^n) sum_(x,y) (-1)^(x dot y) |x chevron.r chevron y|.
$

Write out an explicit matrix representation for $H^(times.o 2)$.

#v(1em)

= Exercise 3
#h(1em) *(Commutation relations for the Pauli matrices)* #h(0.3em)
Verify the commutation relations

$
  [X, Y] = 2i Z; quad [Y, Z] = 2i X; quad [Z, X] = 2i Y.
$

There is an elegant way of writing this using $epsilon_(j k l)$, the antisymmetric tensor on three indices, for which $epsilon_(j k l) = 0$ except for $epsilon_(123) = epsilon_(231) = epsilon_(312) = 1$, and $epsilon_(321) = epsilon_(213) = epsilon_(132) = -1$:

$
  [sigma_j, sigma_k] = 2i sum_(l=1)^(3) epsilon_(j k l) sigma_l.
$

#v(1em)

= Exercise 4
#h(1em)
Suppose $[A, B] = 0$, ${A, B} = 0$, and $A$ is invertible. Show that $B$ must be $0$.

#v(1em)

= Exercise 5
#h(1em)
Suppose $A$ and $B$ are commuting Hermitian operators. Prove that $exp(A) exp(B) = exp(A + B)$.

#pagebreak()

= Exercise 6
#h(1em)
Suppose we have a qubit in the state $|0 chevron.r$, and we measure the observable $X$. What is the average value of $X$? What is the standard deviation of $X$?

#v(1em)

= Exercise 7
#h(1em)
Calculate the probability of obtaining the result $+1$ for a measurement of $arrow(v) dot arrow(sigma)$, given that the state prior to measurement is $|0 chevron.r$. What is the state of the system after the measurement if $+1$ is obtained?

#v(1em)

= Exercise 8
#h(1em)
Show that the average value of the observable $X_1 Z_2$ for a two qubit system measured in the state $(|00 chevron.r + |11 chevron.r ) \/ sqrt(2)$ is zero.

#v(1em)

= Exercise 9
#h(1em)
Verify that the Bell basis forms an orthonormal basis for the two qubit state space.

#v(1em)

= Exercise 1
#h(1em)
Suppose $E$ is any positive operator acting on Alice's qubit. Show that $chevron psi|E times.o I|psi chevron.r$ _takes the same value_ when $|psi chevron.r$ is any of the four Bell states. Suppose some malevolent third party ('Eve') intercepts Alice's qubit on the way to Bob in the superdense coding protocol. Can Eve infer anything about which of the four possible bit strings $00, 01, 10, 11$ Alice is trying to send? If so, how, or if not, why not?

#v(2em)

#text(
  weight: "bold",
)[To archive all results (solutions, report together with your code, etc.) and submit them using Quantum computing course moodle.]

