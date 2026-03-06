// Main report file
#import "template.typ": make-report, report-footnote
#import "metadata.typ": my-report
#import "@preview/theofig:0.1.0": definition
#import "@preview/physica:0.9.8"


// Main content
#show: make-report.with(my-report)
#let Var = math.op("Var")

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

- The notation $chevron phi|$ is used to represent the vector dual to $|phi chevron.r$, so the vector $phi$ conjugate and transposed.
- The notation $|phi chevron.r chevron psi|$ denote the matrix product between the vectors $phi$ and $psi$.

So we have:

#align(
  left,
  $
    H & = 1/sqrt(2) [(|0 chevron.r + |1 chevron.r )chevron 0| + (|0 chevron.r - |1 chevron.r )chevron 1| ] \
      & = 1/sqrt(2) [vec(1, 1) mat(1, 0) + vec(1, -1) mat(0, 1)] \
      & = 1/sqrt(2) [mat(1, 0; 1, 0) + mat(0, 1; 0, -1)] \
      & = 1/sqrt(2) mat(1, 1; 1, -1) \
  $,
)

For $H^(times.o 2)$, we have:

#align(
  left,
  $
    H^(times.o 2) & = H times.o H \
                  & = 1/sqrt(2) mat(1, 1; 1, -1) times.o 1/sqrt(2) mat(1, 1; 1, -1) \
                  & = 1/2 mat(1 mat(1, 1; 1, -1), 1 mat(1, 1; 1, -1); 1 mat(1, 1; 1, -1), -1 mat(1, 1; 1, -1)) \
                  & = 1/2 mat(1, 1, 1, 1; 1, -1, 1, -1; 1, 1, -1, -1; 1, -1, -1, 1) \
  $,
)
We want to prove that $H^(times.o n) = 1/sqrt(2^n) sum_(x,y) (-1)^(x dot y) |x chevron.r chevron y|$ with $x$ and $y$ that represent $n$ qubits, so with $|x chevron.r = |x_1x_2...x_n chevron.r$ and $|y chevron.r = |y_1y_2...y_n chevron.r$.
So $x$ and $y$ are two sequences of bits.

We can define $(x dot y)$ as the bitwise inner product modulo 2:

$ x dot y = sum_(i=1)^n x_i y_i mod 2 $

where $x_i, y_i in { 0, 1 }$.

For the initialization, we have:

#align(
  left,
  $H^(times.o 1) = H &= 1/sqrt(2) [(|0 chevron.r + |1 chevron.r )chevron 0| + (|0 chevron.r - |1 chevron.r )chevron 1| ] \
  &= 1/sqrt(2) (|0 chevron.r chevron 0| + |1 chevron.r chevron 0| + |0 chevron.r chevron 1| - |1 chevron.r chevron 1| ) \
  &= 1/sqrt(2) [ (-1)^(0 dot 0) |0 chevron.r chevron 0| + (-1)^(1 dot 0)|1 chevron.r chevron 0| + (-1)^(0 dot 1)|0 chevron.r chevron 1| + (-1)^(1 dot 1) |1 chevron.r chevron 1| ] \
  &= 1/sqrt(2) sum_(a, b in {0, 1})(-1)^(a dot b) |a chevron.r chevron b|$,
)

Suppose we have
$
  H^(times.o (n - 1)) = 1/sqrt(2^(n - 1)) sum_(x',y' in {0, 1}^(n - 1)) (-1)^(x' dot y') |x' chevron.r chevron y'|
$
By induction,
#align(
  left,
  $
    H^(times.o n) &= H^(times.o (n - 1)) times.o H \
    &= 1/sqrt(2^(n - 1)) sum_(x',y' in {0, 1}^(n - 1)) (-1)^(x' dot y') |x' chevron.r chevron y'| times.o 1/sqrt(2) sum_(a, b in {0, 1})(-1)^(a dot b) |a chevron.r chevron b| \
    &= 1/sqrt(2^(n - 1) times 2) (sum_(x',y' in {0, 1}^(n - 1)) (-1)^(x' dot y') |x' chevron.r chevron y'| times.o sum_(a, b in {0, 1})(-1)^(a dot b) |a chevron.r chevron b|) \
    &= 1/sqrt(2^n) (sum_(x',y' in {0, 1}^(n - 1)) sum_(a, b in {0, 1}) (-1)^(x' dot y') (-1)^(a dot b) |x' chevron.r chevron y'| times.o |a chevron.r chevron b|)^#report-footnote([We can write this thanks to the bilinearity of the tensor product: $(X_1 + X_2) times.o (Y_1 + Y_2) = sum_(i, j)X_i times.o Y_j$]) \
    &= 1/sqrt(2^n) (sum_(x',y' in {0, 1}^(n - 1)) sum_(a, b in {0, 1}) (-1)^(x' dot y') (-1)^(a dot b) |x' chevron.r times.o |a chevron.r chevron y'| times.o chevron b|) \
    &= 1/sqrt(2^n) (sum_(x',y' in {0, 1}^(n - 1)) sum_(a, b in {0, 1}) (-1)^(x' dot y') (-1)^(a dot b) |x' a chevron.r chevron y' b|) \
    &= 1/sqrt(2^n) (sum_(x,y in {0, 1}^n) (-1)^(x dot y) |x chevron.r chevron y|) \
  $,
)

So we have proved by induction that
$
  H^(times.o n) = 1/sqrt(2^n) sum_(x,y) (-1)^(x dot y) |x chevron.r chevron y|.
$


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

The commutation relation is defined as follow:
$
  [A, B] = A B - B A
$

The Pauli matrix are defined as follow:

#align(
  left,
  $
    sigma_0 & ≡ I ≡ mat(1, 0; 0, 1) \
    sigma_1 & ≡ sigma_x ≡ X ≡ mat(0, 1; 1, 0) \
    sigma_2 & ≡ sigma_y ≡ Y ≡ mat(0, -i; i, 0) \
    sigma_3 & ≡ sigma_z ≡ Z ≡ mat(1, 0; 0, -1) \
  $,
)

So we have:

- #align(
    left,
    $
      [X, Y] & = X Y - Y X \
             & = mat(0, 1; 1, 0) mat(0, -i; i, 0) - mat(0, -i; i, 0) mat(0, 1; 1, 0) \
             & = mat(i, 0; 0, -i) - mat(-i, 0; 0, i) \
             & = mat(2i, 0; 0, -2i) \
             & = 2 i times mat(1, 0; 0, -1) \
             & = 2 i Z
    $,
  )

- #align(
    left,
    $
      [Y, Z] & = Y Z - Z Y \
             & = mat(0, -i; i, 0) mat(1, 0; 0, -1) - mat(1, 0; 0, -1) mat(0, -i; i, 0) \
             & = mat(0, i; i, 0) - mat(0, -i; -i, 0) \
             & = mat(0, 2i; 2i, 0) \
             & = 2 i times mat(0, 1; 1, 0) \
             & = 2 i X
    $,
  )

- #align(
    left,
    $
      [Z, X] & = Z X - X Z \
             & = mat(1, 0; 0, -1) mat(0, 1; 1, 0) - mat(0, 1; 1, 0) mat(1, 0; 0, -1) \
             & = mat(0, 1; -1, 0) - mat(0, -1; 1, 0) \
             & = mat(0, 2; -2, 0) \
             & = 2 times mat(0, 1; -1, 0) \
             & = 2 times mat(0, (-i)^2; i^2, 0) \
             & = 2 i Y
    $,
  )

#v(1em)

= Exercise 4
#h(1em)
Suppose $[A, B] = 0$, ${A, B} = 0$, and $A$ is invertible. Show that $B$ must be $0$.

The anticommutation relation is defined as follow:
$
  {A, B} = A B + B A
$

So if we have $[A, B] = 0$, ${A, B} = 0$, and $A$ invertible, it means that

#align(
  left,
  $
        & [A, B] = {A, B} \
    <=> & A B - B A = A B + B A \
    <=> & 2 B A = 0 \
    <=> & B A A^(-1) = 0 A^(-1) \
    <=> & B = 0
  $,
)

So $B$ must be $0$.

#v(1em)

= Exercise 5
#h(1em)

Suppose $A$ and $B$ are commuting Hermitian operators. Prove that $exp(A) exp(B) = exp(A + B)$.

An operator is Hermitian if its transpose conjugate is equal to the operator itself.

As $A$ and $B$ are commuting, we have $[A, B] = 0 <=> A B - B A = 0 <=> A B = B A$.

The Taylor expansion of the exponential function for an operator $X$ is:

$ exp(X) = sum_(k=0)^infinity X^k/k! $

So we have:

#align(
  left,
  $
    exp(A) exp(B) &= sum_(k=0)^infinity A^k/k! sum_(j=0)^infinity B^j/j! \
    &= sum_(k=0)^infinity sum_(j=0)^infinity (A^k B^j)/(k!j!) \
    &= sum_(n=0)^infinity sum_(k=0)^n (A^k B^(n - k))/(k!(n - k)!) & text("let " n = j + k) \
    &= sum_(n=0)^infinity sum_(k=0)^n n!/(n!k!(n - k)!)(A^k B^(n - k)) \
    &= sum_(n=0)^infinity 1/n! sum_(k=0)^n n!/(k!(n - k)!) (A^k B^(n - k)) \
    &= sum_(n=0)^infinity 1/n! sum_(k=0)^n vec(n, k) (A^k B^(n - k)) & text("by definition of "vec(n, k) = n!/(k!(n - k)!)) \
    &= sum_(n=0)^infinity 1/n! (A + B)^n & text("according to binomial theorem"^#report-footnote([Binomial theorem: $(A + B)^n = sum_(k=0)^n vec(n, k) A^k B^(n - k)$])) \
    &= exp(A + B) & text("according to taylor expansion")
  $,
)


= Exercise 6
#h(1em)
Suppose we have a qubit in the state $|0 chevron.r$, and we measure the observable $X$. What is the average value of $X$? What is the standard deviation of $X$?

The state of a qubit can be described as the combination of two states: $|0 chevron.r$ and $|1 chevron.r$.
So the state of a qubit $|phi chevron.r$ can be written as $ |phi chevron.r = alpha |0 chevron.r + beta |1 chevron.r $ with $alpha, beta in CC$.

As the qubit state is a combination of two states, the qubit state cannot be observed.
However, the qubit state can be measured to fix the state of the qubit to state $|0 chevron.r$ or state $|1 chevron.r$.

According to the Born Rule, for a qubit $|phi chevron.r = alpha |0 chevron.r + beta |1 chevron.r$, the probability that the qubit is in the state $|0 chevron.r$ is given by $|alpha|^2$ and the probability that the qubit is in the state $|1 chevron.r$ is given by $|beta|^2$.
As $|alpha|^2$ and $|beta|^2$ are probabilities, we have that $|alpha|^2 + |beta|^2 = 1$.

If we consider that we have a qubit in the state $|0 chevron.r$, it means that $|alpha|^2 = 1$ and $|beta|^2 = 0$ since $|alpha|^2 + |beta|^2 = 1 <=> 1 + |beta|^2 = 1 <=> |beta|^2 = 0 <=> beta = 0$.
As $alpha$ is a complex number, we cannot determine the value of $alpha$.

So the average value of the observable $X$ is given by:
$ EE[X] = alpha |0 chevron.r + beta |1 chevron.r = alpha |0 chevron.r $

The standard deviation of $X$ is given by:
#align(
  left,
  $
    Var[X] & = EE[X^2] - EE[X]^2 \
           & = EE[(alpha |0 chevron.r + beta |1 chevron.r)^2] - (alpha |0 chevron.r)^2 \
           & = EE[alpha^2 vec(1, 0) vec(1, 0)^T] - alpha^2 vec(1, 0) vec(1, 0)^T \
           & = alpha^2 vec(1, 0) vec(1, 0)^T - alpha^2 vec(1, 0) vec(1, 0)^T \
           & = 0
  $,
)

#v(1em)

= Exercise 7
#h(1em)
Calculate the probability of obtaining the result $+1$ for a measurement of $arrow(v) dot arrow(sigma)$, given that the state prior to measurement is $|0 chevron.r$. What is the state of the system after the measurement if $+1$ is obtained?

By definition, we have our measurement $M = arrow(v) dot arrow(sigma) = v_1 sigma_X + v_2 sigma_Y + v_3 sigma_Z$ with $||arrow(v)||^2 = 1$.

So:

#align(
  left,
  $
    M & = v_1 sigma_X + v_2 sigma_Y + v_3 sigma_Z \
      & = v_1 mat(0, 1; 1, 0) + v_2 mat(0, -i; i, 0) + v_3 mat(1, 0; 0, -1) \
      & = mat(0, v_1; v_1, 0) + mat(0, -i v_2; i v_2, 0) + mat(v_3, 0; 0, -v_3) \
      & = mat(v_3, v_1 -i v_2; v_1 + i v_2, -v_3) \
  $,
)

The observable $M$ has a spectral decomposition given by

$ M = sum_m m P_m $

where $P_m$ is the projector onto the eigenspace of $M$ with eigenvalue $m$.

The projector $P_m$ satisfy the relation $sum_m P_m = I$.

The state of the quantum system after measurement is given by the formula

$ (P_m|phi chevron.r)/sqrt(p(m)) $

with $p(m) = chevron phi | P_m | phi chevron.r$ the probability to obtain result $m$.

We want to find eigenvalues of $M$, so we want to find $lambda$ such that $det(M - lambda I) = 0$. We have:

#align(
  left,
  $
    det(M - lambda I) & = det(mat(v_3 - lambda, v_1 -i v_2; v_1 + i v_2, -v_3 - lambda)) \
                      & = (v_3 - lambda)(-v_3 - lambda) - (v_1 -i v_2)(v_1 + i v_2) \
                      & = (- lambda + v_3)(- lambda - v_3) - (v_1 -i v_2)(v_1 + i v_2) \
                      & = lambda^2 - (v_3^2 + v_1^2 + v_2^2) \
                      & = lambda^2 - ||arrow(v)||^2 \
                      & = lambda^2 - 1 \
  $,
)

So $det(M - lambda I) = 0 <==> lambda^2 - 1 = 0 <==> lambda = plus.minus 1$

So we have: $M = P_1 - P_(-1)$.

We know that the result $m = +1$ is obtained.

So we want to find value of projector $P_1$ that correspond to eigenvalue $+1$.

As $M = P_1 - P_(-1)$ and $sum_m P_m = I$, we have:

$ I + M = P_1 + P_(-1) + P_1 - P_(-1) = 2P_1 <==> P_1 = (I + M)/2 $

So

#align(
  left,
  $
    P_1 & = 1/2(I + M) \
        & = 1/2(mat(1, 0; 0, 1) + mat(v_3, v_1 -i v_2; v_1 + i v_2, -v_3)) \
        & = 1/2mat(v_3 + 1, v_1 -i v_2; v_1 + i v_2, -v_3 + 1) \
  $,
)

Now, we can compute the probability $p(+1)$.
We know that the state prior to measurement is $phi = |0 chevron.r$.


#align(
  left,
  $
    p(+1) & = chevron 0 | P_1 | 0 chevron.r \
          & = 1/2 mat(1, 0)mat(v_3 + 1, v_1 -i v_2; v_1 + i v_2, -v_3 + 1) vec(1, 0) \
          & = 1/2 mat(v_3 + 1, v_1 - i v_2) vec(1, 0) \
          & = (v_3 + 1)/2 \
  $,
)

So the state of the quantum system after measurement is:

#align(
  left,
  $
    (P_m|phi chevron.r)/sqrt(p(m)) & = (P_1|0 chevron.r)/sqrt(p(+1)) \
                                   & = 1/2 1/sqrt((v_3 + 1)\/2)mat(v_3 + 1, v_1 -i v_2; v_1 + i v_2, -v_3 + 1)vec(1, 0) \
                                   & = 1/sqrt(2(v_3 + 1))vec(v_3 + 1, v_1 + i v_2) \
  $,
)


#v(1em)

= Exercise 8
#h(1em)
Show that the average value of the observable $X_1 Z_2$ for a two qubit system measured in the state $(|00 chevron.r + |11 chevron.r ) \/ sqrt(2)$ is zero.

First, $X_1 Z_2$ means that the Pauli matrix $X$ is applied to qubit 1 and Pauli matrix $Z$ is applied to qubit 2. So it means that $X_1 Z_2 = X times.o Z$.
Indeed, $(X times.o Z)|a b chevron.r = (X|a chevron.r) times.o (Z|b chevron.r)$.

First of all, we need to study impact of Pauli matrices on single qubit. We have:

#align(
  left,
  $
    X|0 chevron.r & = mat(0, 1; 1, 0) vec(1, 0) = vec(0, 1) = |1 chevron.r \
    X|1 chevron.r & = mat(0, 1; 1, 0) vec(0, 1) = vec(1, 0) = |0 chevron.r \
    Z|0 chevron.r & = mat(1, 0; 0, -1) vec(1, 0) = vec(1, 0) = |0 chevron.r \
    Z|1 chevron.r & = mat(1, 0; 0, -1) vec(0, 1) = vec(0, -1) = -|1 chevron.r \
  $,
)

So the $X$ Pauli matrix transform state $|1 chevron.r$ to state $|0 chevron.r$ and state $|0 chevron.r$ to state $|1 chevron.r$, and the $Z$ Pauli matrix transform state $|1 chevron.r$ to state $-|1 chevron.r$ and leaves the state $|0 chevron.r$ unchanged.

We have:
$
  chevron a b|c d chevron.r = (chevron a|times.o chevron b|)(|c chevron.r times.o |d chevron.r) = chevron a|c chevron.r times.o chevron b|d chevron.r
$

and:

#align(
  left,
  $
    chevron 0|0 chevron.r & = mat(1, 0)vec(1, 0) = 1 \
    chevron 0|1 chevron.r & = mat(1, 0)vec(0, 1) = 0 \
    chevron 1|0 chevron.r & = mat(0, 1)vec(1, 0) = 0 \
    chevron 1|1 chevron.r & = mat(0, 1)vec(0, 1) = 1 \
  $,
)

So as the tensor product between two scalar is a simple multiplication, we have:
$
  chevron a b|c d chevron.r =
  cases(
    1 "if" a = c "and" b = d,
    0 "else"
  )
$


The average value of an observable $M$ for a state $|psi chevron.r$ is given by: $chevron psi | M | psi chevron.r$.

We have $|psi chevron.r = (|00 chevron.r + |11 chevron.r ) \/ sqrt(2)$
and $M = X_1 Z_2 = X times.o Z$.

So the average value of the observable $X_1Z_2$ is:

#align(
  left,
  $
    chevron psi | M | psi chevron.r & = (chevron 00| + chevron 11|) / sqrt(2) X_1Z_2 (|00 chevron.r + |11 chevron.r ) / sqrt(2) \
    & = 1/2 (chevron 00| + chevron 11|) (X_1Z_2|00 chevron.r + X_1Z_2|11 chevron.r ) \
    & = 1/2 (chevron 00| + chevron 11|) (|10 chevron.r - |01 chevron.r ) \
    & = 1/2 (chevron 00|10 chevron.r + chevron 11|10 chevron.r - chevron 00|01 chevron.r - chevron 11|01 chevron.r ) \
    & = 1/2 (0 + 0 - 0 - 0 ) \
    &= 0
  $,
)

#v(1em)

= Exercise 9
#h(1em)
Verify that the Bell basis forms an orthonormal basis for the two qubit state space.

The Bell basis is given by:

#align(
  left,
  $
    00 & :( |00 chevron.r + |11 chevron.r) / sqrt(2) = |e_0 chevron.r \
    01 & :( |00 chevron.r - |11 chevron.r) / sqrt(2) = |e_1 chevron.r \
    10 & :( |10 chevron.r + |01 chevron.r) / sqrt(2) = |e_2 chevron.r \
    11 & :( |01 chevron.r - |10 chevron.r) / sqrt(2) = |e_3 chevron.r \
  $,
)

To verify that the Bell basis forms an orthonormal basis for the two qubit state space, we need to check if each element is orthogonal with the others and if each element has a norm of 1.

=== Orthogonality

We will use the result of the previous exercise:

$
  chevron a b|c d chevron.r =
  cases(
    1 "if" a = c "and" b = d,
    0 "else"
  )
$

So we have:

$
  chevron e_0 | e_1 chevron.r &= ( chevron 00| + chevron 11|) / sqrt(2) ( |00 chevron.r - |11 chevron.r) / sqrt(2) = 1/2(chevron 00|00 chevron.r - chevron 00|11 chevron.r + chevron 11|00 chevron.r - chevron 11|11 chevron.r) = 1/2 (1 - 1) = 0 \
  chevron e_0 | e_2 chevron.r &= ( chevron 00| + chevron 11|) / sqrt(2) ( |10 chevron.r + |01 chevron.r) / sqrt(2) = 1/2(chevron 00|10 chevron.r + chevron 00|01 chevron.r + chevron 11|10 chevron.r + chevron 11|01 chevron.r) = 0 \
  chevron e_0 | e_3 chevron.r &= ( chevron 00| + chevron 11|) / sqrt(2) ( |01 chevron.r - |10 chevron.r) / sqrt(2) = 1/2(chevron 00|01 chevron.r - chevron 00|10 chevron.r + chevron 11|01 chevron.r - chevron 11|10 chevron.r) = 0 \
  chevron e_1 | e_2 chevron.r &= ( |00 chevron.r - |11 chevron.r) / sqrt(2) ( |10 chevron.r + |01 chevron.r) / sqrt(2) = 1/2(chevron 00|10 chevron.r + chevron 00|01 chevron.r - chevron 11|10 chevron.r - chevron 11|01 chevron.r) = 0 \
  chevron e_1 | e_3 chevron.r &= ( |00 chevron.r - |11 chevron.r) / sqrt(2) ( |01 chevron.r - |10 chevron.r) / sqrt(2) = 1/2(chevron 00|01 chevron.r - chevron 00|10 chevron.r - chevron 11|01 chevron.r + chevron 11|10 chevron.r) = 0 \
  chevron e_2 | e_3 chevron.r &= ( |10 chevron.r + |01 chevron.r) / sqrt(2) ( |01 chevron.r - |10 chevron.r) / sqrt(2) = 1/2(chevron 10|01 chevron.r - chevron 10|10 chevron.r + chevron 01|01 chevron.r + chevron 01|10 chevron.r) = 1/2 (-1 + 1) = 0 \
$

So the Bell basis form an orthogonal basis for the two qubit state space.

=== Unitary norm

The norm of a vector is defined as the square root of its inner product with itself.
So we have:

$ |||psi chevron.r|| = sqrt(chevron psi|psi chevron.r) $


#v(1em)

= Exercise 10
#h(1em)
Suppose $E$ is any positive operator acting on Alice's qubit. Show that $chevron psi|E times.o I|psi chevron.r$ _takes the same value_ when $|psi chevron.r$ is any of the four Bell states. Suppose some malevolent third party ('Eve') intercepts Alice's qubit on the way to Bob in the superdense coding protocol. Can Eve infer anything about which of the four possible bit strings $00, 01, 10, 11$ Alice is trying to send? If so, how, or if not, why not?

#v(2em)

#text(
  weight: "bold",
)[To archive all results (solutions, report together with your code, etc.) and submit them using Quantum computing course moodle.]

