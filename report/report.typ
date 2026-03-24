// Main report file
#import "template.typ": make-report, report-footnote
#import "metadata.typ": my-report
#import "@preview/theofig:0.1.0": definition
#import "@preview/physica:0.9.8"
#import "@preview/quill:0.7.2": *


// Main content
#show: make-report.with(my-report)


= Exercise 1

Prove that the binary entropy $H_"bin" (p)$ attains its maximum value of one at $p = 1\/2$.

Suppose we have a binary variable $X$ that follows a Bernoulli distribution $cal(B)$ of parameter $p$.

#align(
  center,
  $PP(X = 0) &= p \
  PP(X = 1) &= 1 - p$,
)

The entropy is defined as:

#align(
  center,
  $H(X) &= - sum_(x in {0, 1}) PP(X = x) log_2(PP(X = x)) \
  &= -PP(X = 0)log_2(PP(X = 0)) - PP(X = 1) log_2(PP(X = 1)) \
  &= - p log_2(p) - (1 - p) log_2(1 - p)\
  &= f(p)$,
)

We want to find the parameter $p$ that maximize the entropy.

To do that, we can compute the derivate of the $f$ function according to the parameter $p$ to find optima of the function.
We have:

#align(
  center,
  $
    (partial f)/(partial p) & = partial / (partial p) (- p log_2(p) - (1 - p) log_2(1 - p)) \
                            & = partial / (partial p) (- p ln(p)/ln(2) - (1 - p) ln(1 - p)/ln(2)) \
                            & = - ln(p)/ln(2) + p / (p ln(2)) + ln(1 - p)/ln(2) - (1 - p)/((1 - p)ln(2)) \
                            & = - (ln(p) + 1 + ln(1 - p) - 1)/ln(2) \
                            & = - (ln(p) + ln(1 - p))/ln(2) \
                            & = ln((1 - p)/p) dot 1/ln(2) \
  $,
)

The optimum is obtained for $(partial f)/(partial p) = 0$, so:

#align(
  center,
  $
    & text("     ") (partial f)/(partial p) = 0 \
    & <==> ln((1 - p)/p) dot 1/ln(2) = 0 \
    & <==> ln((1 - p)/p) = 0 \
    & <==> (1 - p)/p = e^0 \
    & <==> 1 - p = p \
    & <==> p = 1/2 \
  $,
)

So the entropy of a binary variable attains its maximum value at $p = 1/2$.
The maximum value of entropy obtained for $p = 1/2$ is:

#align(
  center,
  $
    f(1/2) & = -1/2 log_2(1/2) - (1 - 1/2)log_2(1 - 1/2) \
           & = 1/2 + 1/2 \
           & = 1 \
  $,
)

= Exercise 2: Sub-additivity of the Shannon entropy

Show that
$
  H(p(x,y) || p(x) p(y)) = H(p(x)) + H(p(y)) - H(p(x,y)).
$

By definition of the Kullback-Leibler divergence, $H(P || Q) = sum_(x in cal(X)) P(x) log(P(x)/Q(x))$.

The entropy is defined as $H(p(x)) = - sum_x p(x) log(p(x))$.
We know that $log$ is stricly increasing, with undefined value for $0$ and $log(1) = 0$.
So as probabilities are defined in $[0, 1]$, the $log$ is always less or equal to zero.
So the entropy is always greater or equal to zero.

So we have:

#align(left,
$
  H(p(x,y) || p(x) p(y)) &= sum_x sum_y p(x, y) log(p(x, y) / (p(x)p(y))) \
  &= sum_x sum_y p(x, y) [log(p(x, y)) - log(p(x)p(y))] \
  &= sum_x sum_y p(x, y) log(p(x, y)) - sum_x sum_y p(x, y)log(p(x)p(y)) \
  &= - H(p(x, y)) - sum_x sum_y p(x, y)[log(p(x)) + log(p(y))] \
  &= - H(p(x, y)) - sum_x sum_y p(x, y)log(p(x)) - sum_x sum_y p(x, y)log(p(y)) \
  &= - H(p(x, y)) - sum_x p(x)log(p(x)) - sum_y p(y)log(p(y)) \
  &= - H(p(x, y)) + H(p(x)) + H(p(y)) \

$)

Deduce that $H(X, Y) <= H(X) + H(Y)$, with equality if and only if $X$ and $Y$ are independent random variables.

We have shown that $H(p(x,y) || p(x) p(y)) = H(p(x)) + H(p(y)) - H(p(x,y))$.

As the entropy of discrete variables is always greater or equal to zero, we have:

#align(left, 
$
  H(p(x,y) || p(x) p(y)) &>= 0 \
  <==> H(p(x)) + H(p(y)) - H(p(x,y)) &>= 0 \
  <==> H(p(x)) + H(p(y)) &>= H(p(x,y)) \
$)

If $p(x)$ and $p(y)$ are independent, $p(x, y) = p(x)p(y)$.

So
#align(left,
$
  H(p(x, y)) &= H(p(x)p(y)) \
  &= -sum_x sum_y p(x)p(y) log(p(x)p(y)) \
  &= -sum_x sum_y p(x)p(y) [log(p(x)) + log(p(y))] \
  &= -sum_x sum_y p(x)p(y) log(p(x)) -sum_x sum_y p(x)p(y)log(p(y)) \
  &= -sum_x p(x) log(p(x)) -sum_y p(y)log(p(y)) \
  &= H(p(x)) + H(p(y))
$)

So $H(p(x)) + H(p(y)) >= H(p(x,y))$ and if $p(x)$ and $p(y)$ are independent,

$ H(p(x)) + H(p(y)) >= H(p(x,y)) = H(p(x)) + H(p(y)) $

= Exercise 3: Generalised measurements can decrease entropy

Suppose a qubit is in the state $rho$ measured using the measurement operators
$M_1 = |0 chevron.r chevron.l 0|$ and $M_2 = |0 chevron.r chevron.l 1|$.
If the result of the measurement is unknown to us then the state of the system afterwards is
$M_1 rho M_1^dagger + M_2 rho M_2^dagger$.
Show that this procedure can _decrease_ the entropy of the qubit.

We have the two following measurement operators:

- $M_1 = |0 chevron.r chevron.l 0| = vec(1, 0) mat(1, 0) = mat(1, 0; 0, 0)$
- $M_2 = |0 chevron.r chevron.l 1| = vec(1, 0) mat(0, 1) = mat(0, 1; 0, 0)$

The density $rho$ is defined as follow:

$ rho = sum_i p_i |psi_i chevron.r chevron psi_i| $

with $p_i$ the probability to be in the state $|psi_i chevron.r$.
As $p_i$ is a probability, $sum_i p_i = 0$.

In our case, as we work with only  one qubit, this qubit can be in state $|0 chevron.r$ or $|1 chevron.r$.

So we have:

#align(left, 
  $
  rho &= sum_i p_i |psi_i chevron.r chevron psi_i| \
  &= p_0 |0 chevron.r chevron 0| + p_1 |1 chevron.r chevron 1| \
  &= p_0 vec(1, 0) mat(1, 0) + p_1 vec(0, 1) mat(0, 1) \
  &= mat(p_0, 0; 0, 0) + mat(0, 0; 0, p_1) \
  &= mat(p_0, 0; 0, p_1)
  $
)

Suppose that the result of the measurement is unknown to us.

So the state of the system afterwards is $rho' = M_1 rho M_1^dagger + M_2 rho M_2^dagger$.

So we have:

#align(left, 
$
  rho' &= M_1 rho M_1^dagger + M_2 rho M_2^dagger \
  &= mat(1, 0; 0, 0) mat(p_0, 0; 0, p_1) mat(1, 0; 0, 0) + mat(0, 1; 0, 0)mat(p_0, 0; 0, p_1) mat(0, 0; 1, 0) \
  &= mat(p_0, 0; 0, 0) mat(1, 0; 0, 0) + mat(0, p_1; 0, 0) mat(0, 0; 1, 0) \
  &= mat(p_0, 0; 0, 0) + mat(p_1, 0; 0, 0) \
  &= mat(p_0 + p_1, 0; 0, 0) \
  &= mat(1, 0; 0, 0) \
  &= |0 chevron.r chevron 0|
$
)

So as $rho = p_0 |0 chevron.r chevron 0| + p_1 |1 chevron.r chevron 1|$ and $rho' = |0 chevron.r chevron 0|$, it means that the quantity of information has decreased.
Indeed, $rho'$ can only be in one state $|0 chevron.r$ in a deterministic way, meaning that the entropy of $rho'$ is zero whereas the entropy of $rho$ is greater or equal to zero. Indeed, we have:
- $H(rho) = - sum_i p_i log_2(p_i) = - p_0 log_2(p_0) - p_1 log_2(p_1) >= 0$ since $log_2$ of variable less than 1 is negative and as $p_i$ is a probability, $p_i$ is always positive.
- $H(rho') = - sum_i p_i log_2(p_i) = -1 log_2(1) = 0$ since $log_2(1) = 0$.

So this procedure can decrease the entropy of the qubit.

= Exercise 4

Suppose $|psi chevron.r$ and $|phi chevron.r$ are two orthogonal quantum states of a single qubit.
Design a quantum circuit with two input qubits (the "data" and the "target" qubits),
with the data qubit in either the state $|psi chevron.r$ or $|phi chevron.r$,
and the target qubit prepared in the standard state $|0 chevron.r$,
which produces as output $|psi chevron.r |psi chevron.r$ or $|phi chevron.r |phi chevron.r$,
depending on whether $|psi chevron.r$ or $|phi chevron.r$ was input to the data qubit.

We build a quantum circuit such as:
- We have a data state that can take values $|phi chevron.r$ or $|psi chevron.r$.
- We prepare a target state that takes the value $|0 chevron.r$.

So initialy, we have either the state $|phi 0 chevron.r$ or the state $|psi 0 chevron.r$.

As $|psi chevron.r$ and $|phi chevron.r$ are two orthogonal quantum states of a single qubit, they form an orthogonal basis {$|psi chevron.r$, $|phi chevron.r$}.

So it means that we can find an operator $U$ that remaps the states to the basis {$|0 chevron.r$, $|1 chevron.r$}.
As $U$ is an operator, $U$ must respect the constraint $U^dagger U = I$.

So we will have for instance: $U times.o |psi chevron.r = |0 chevron.r$ and $U times.o |phi chevron.r = |1 chevron.r$.

After applying the operator $U$, the circuit will be in state either $|0 0 chevron.r$ or $|1 0 chevron.r$.
Now, if we apply the operator CNOT, the state $|0 0 chevron.r$ remains the same whereas the state $|1 0 chevron.r$ will become $|1 1 chevron.r$ due to the construction of the operator.
Indeed, the CNOT operator invert the state of the target qubit (the second) if the control qubit (the first) is equal to $1$, else leave the target qubit unchanged.

So now, the circuit will be in state either $|0 0 chevron.r$ or $|1 1 chevron.r$.

Finally, we apply the inverse operator $U^dagger$ to the two qubits to come back to the basis {$|psi chevron.r |phi chevron.r$}.

The circuit can be drawn like in @circuit.

#figure(
  caption: "Quantum circuit to clone states of two orthogonal qubits",
  quantum-circuit(
    lstick([$|psi chevron.r$ or $|phi chevron.r$]), $U$, ctrl(1), $U^dagger$, rstick([$|psi chevron.r$ or $|phi chevron.r$]), [\ ],
    lstick($|0 chevron.r$), 1, targ(), $U^dagger$, rstick([$|psi chevron.r$ or $|phi chevron.r$])
  )
)<circuit>

= Exercise 5

#set math.equation(numbering: "(1)")

Suppose Alice sends Bob an equal mixture of the four pure states
$
  |X_1 chevron.r & = |0 chevron.r \
  |X_2 chevron.r & = sqrt(1/3) [ |0 chevron.r + sqrt(2)|1 chevron.r] \
  |X_3 chevron.r & = sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(2 pi i \/ 3)|1 chevron.r] \
  |X_4 chevron.r & = sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(4 pi i \/ 3)|1 chevron.r]
$

Show that the maximum mutual information between Bob's measurement and Alice's transmission
is less than one bit.
A POVM which achieves $approx 0.415$ bits is known.
Can you construct this or better yet, one which achieves the Holevo bound?

// The mutual information is defined as follow:

// $ I(X; Y) = - sum_(x, y) p(x, y) log(p(x, y)/(p(x)p(y))) $

*Von Neumann entropy for quantum states*

The entropy of a quantum state with density $rho$ is given by:

$ S(rho) = - tr(rho log rho) $


*Theorem 11.8: Basic properties of von Neumann entropy*

(1) The entropy is non-negative. The entropy is zero if and only if the state is pure.

(2) In a $d$-dimensional Hilbert space the entropy is at most $log d$. The entropy is equal to $log d$ if and only if the system is in the completely mixed state $I / d$.

(3) Suppose a composite system $A B$ is in a pure state. Then $S(A) = S(B)$.

(4) Suppose $p_i$ are probabilities, and the states $rho_i$ have support on orthogonal subspaces. Then
$
S( sum_i p_i rho_i ) = H(p_i) + sum_i p_i S(rho_i).
$

(5) Joint entropy theorem: Suppose $p_i$ are probabilities, $|i⟩$ are orthogonal states for a system $A$, and $rho_i$ is any set of density operators for another system $B$. Then
$
S( sum_i p_i |i chevron.r chevron i| times.o rho_i ) = H(p_i) + sum_i p_i S(rho_i).
$

*Holevo bound theorem*:  
Suppose Alice prepares a state $rho_x$ where $x = 0, dots, n$ with probabilities $p_0, dots, p_n$.
Bob performs a measurement described by POVM elements ${E_y} = {E_0, dots, E_m}$ on that state, with measurement outcome $Y$.

The Holevo bound states that for any such measurement Bob may do:
$
I(X; Y) <= S(rho) - sum_x p_x S(rho_x)
$
where
$rho = sum_x p_x rho_x$.

As all the four pure states are only a composition of qubits $|0 chevron.r$  and $|1 chevron.r$, it means that they live in the ${|0 chevron.r, |1 chevron.r}$ basis which is an Hilbert basis.

In accordance with point (2) of von Neumann's properties of entropy, since the states lie in a two-dimensional Hilbert space, the entropy is at most $log 2 = 1$ bit, with equality holding only if the system is in the fully mixed state $I/2$.

// So to have the mutual information equal to 1 bit, Alice and Bob must have their system in the state $I/2$.
// In fact, mutual information tells us to what extent knowing the state of Bob's system allows us to determine the state of Alice's system, and vice versa.

// And as shown on @venn, having mutual information equal to 1 in this case corresponds to the fact that knowledge of the state of Bob's system (or Alice's) fully allows us to determine the state of Alice's system (or Bob's), and that the entropy of Bob's system (or Alice's) is equal to 1.

// #figure(image("img/venn.svg"), caption: "Venn diagram of entropy of two random variables X and Y") <venn>

We want to find the bound of the mutual information according to the Holevo bound theorem.

_Computation of $sum_i p_i S(rho_i)$_

Alice send with probability $1/4$ one of the four pure states with density $rho_i$.
As she sends some pure state, according to property (1) of entropy of Von Neumann, the entropy is 0.

So we have:

#align(left,
$
  sum_i p_i S(rho_i) &= sum_i p_i dot 0 = 0
$)

_Precomputations_

#align(center, 
$
  rho_1 &= |X_1 chevron.r chevron X_1| \
  &= |0 chevron.r chevron 0| \
  &= mat(1, 0; 0, 0)$)

#align(left, $
  rho_2 &= |X_2 chevron.r chevron X_2| \
  &= sqrt(1/3) [ |0 chevron.r + sqrt(2)|1 chevron.r] sqrt(1/3) [ chevron 0| + sqrt(2) chevron 1| ] \
  &= 1/3 [ vec(1, 0) + sqrt(2)vec(0, 1)] [ mat(1, 0) + sqrt(2) mat(0, 1) ] \
  &= 1/3 vec(1, sqrt(2))  mat(1, sqrt(2)) \
  &= 1/3 mat(1, sqrt(2); sqrt(2), 2) \
$)

#align(left, 
$
  rho_3 &= |X_3 chevron.r chevron X_3| \
  &= sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(2 pi i \/ 3)|1 chevron.r] sqrt(1/3) [ chevron 0| + sqrt(2) e^(-2 pi i \/ 3) chevron 1| ] \
  &= 1/3 [ vec(1, 0) + sqrt(2) e^(2 pi i \/ 3)vec(0, 1)] [ mat(1, 0) + sqrt(2) e^(-2 pi i \/ 3) mat(0, 1) ] \
  &= 1/3 vec(1, sqrt(2) e^(2 pi i \/ 3))  mat(1, sqrt(2) e^(-2 pi i \/ 3)) \
  &= 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2e^(0)) \
  &= 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) \
$)

#align(left, 
$
  rho_4 &= |X_4 chevron.r chevron X_4| \
  &= sqrt(1/3) [ |0 chevron.r + sqrt(2) e^(4 pi i \/ 3)|1 chevron.r] sqrt(1/3) [ chevron 0| + sqrt(2) e^(-4 pi i \/ 3) chevron 1| ] \
  &= 1/3 [ vec(1, 0) + sqrt(2) e^(4 pi i \/ 3)vec(0, 1)] [ mat(1, 0) + sqrt(2) e^(-4 pi i \/ 3) mat(0, 1) ] \
  &= 1/3 vec(1, sqrt(2) e^(4 pi i \/ 3))  mat(1, sqrt(2) e^(-4 pi i \/ 3)) \
  &= 1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2) \
$)

_Computation of $S(rho)$_

If Alice sends Bob an equal mixture of the four pure states, it means that Bob will get one of the $|X_i chevron.r$ with probability $p_i = 1/4$.

So Bob can compute the density $rho$ of the system.


$
  rho &= sum_i p_i rho_i \
  &= 1/4 rho_1 + 1/4 rho_2 + 1/4 rho_3 + 1/4 rho_4 \
  &= 1/4 mat(1, 0; 0, 0) + 1/12 mat(1, sqrt(2); sqrt(2), 2) + 1/12 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) + 1/12 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2) \
  &= 1/12( mat(3, 0; 0, 0) + mat(1, sqrt(2); sqrt(2), 2) + mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2) + mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 1/12 mat(6, sqrt(2)(1 + e^(-2 pi i \/ 3) + e^(-4 pi i \/ 3)); sqrt(2) (1 + e^(2 pi i \/ 3) + e^(4 pi i \/ 3)), 6) \
  &= 1/12 mat(6, sqrt(2)(e^(-6 pi i \/ 3) + e^(-2 pi i \/ 3) + e^(-4 pi i \/ 3)); sqrt(2) (e^(6 pi i \/ 3) + e^(2 pi i \/ 3) + e^(4 pi i \/ 3)), 6) \
  &= 1/12 mat(6, sqrt(2)(e^(-2 pi i \/ 3)^3 + e^(-2 pi i \/ 3) + e^(-4 pi i \/ 3)^2); sqrt(2) (e^(6 pi i \/ 3)^3 + e^(2 pi i \/ 3) + e^(4 pi i \/ 3)^2), 6) \
  &= 1/12 mat(6, 0; 0, 6)^#report-footnote([As $e^(2 pi i \/ 3)$ and $e^(-2 pi i \/ 3)$ are primitive root. Indeed, $e^(2 pi i \/ 3)^3 = e^(-2 pi i \/ 3)^3 = 1$ so $e^(2 pi i \/ 3) + e^(2 pi i \/ 3)^2 + e^(2 pi i \/ 3)^3 =e^(-2 pi i \/ 3) + e^(-2 pi i \/ 3)^2 + e^(-2 pi i \/ 3)^3 = 0$ ]) \
  &= I/2
$ <eq-1>

So the entropy of Bob's system is maximal: $S(rho) = S(I/2) = log 2 = 1$.

So according to the Holevo bound theorem, we have:

#align(left,
$
  I(X; Y) &<= S(rho) - sum_x p_x S(rho_x) \
  <==> I(X; Y) &<= S(I\/2) - 0 \
  <==> I(X; Y) &<= 1
$)

Now we want to prove that the mutual information is stricly less than 1.

Mutual information is maximized only if Bob can determine Alice's qubit state without any error.
Thus, if there is any overlap between the qubits $|X_i chevron.r$, Bob might make a mistake, and the mutual information would not be maximized.
Indeed, mutual information tells us to what extent knowing the state of Bob's system allows us to determine the state of Alice's system, and vice versa.

As the entropy of Bob's system is of 1, we want that the system of Bob allows to fully determinate the Alice's system to have a mutual information of 1.

So we want to verify whether the four qubits do not overlap, that is, whether they are orthogonal.

We have:

#align(left, 
$
  chevron X_1 | X_2 chevron.r &= sqrt(1/3) chevron 0|  [ |0 chevron.r + sqrt(2)|1 chevron.r] \
  &= sqrt(1/3) mat(1, 0) vec(1, sqrt(2)) \
  &= sqrt(1/3)
$)

So there is an overlap between $|X_1 chevron.r$ and $|X_2 chevron.r$, meaning that Bob might make a mistake.
So the mutual information is stricly less than 1.

The POVM (Posivite Operator-Valued Measure) is used for the analysis of the measurement.
Indeed, suppose that a measurement is achieved with a measurement operator $M_m$ on a quantum system in the state $|psi chevron.r$, then the probability of outcome $m$ is given by

$ p(m) = chevron psi|E_m|psi chevron.r $ with $E_m = M_m^dagger M_m$.

Due to the property of completeness equation of the measurement operator, we have: 

$ sum_m M_m^dagger M_m = sum_m E_m = I $

On top of that, as $p(m)$ is a probability, $p(m) >= 0$ $forall m$.
So $chevron psi|E_m|psi chevron.r &>= 0$ $forall E_m$, which means that $E_m$ is a positif operator.

The complete set of operators ${E_m}$ is known as POVM.

So we want to construct a set of operators ${E_m}$ such that:
- Each operator $E_m$ is positive
- $sum_m E_m = I$

From the calculation of @eq-1, we see that the result is $rho = I/2$.
We also see that each $rho_i$ is strictly positive.
Indeed, since the exponential function and the square root are non-negative, this means that each $rho_i$ is composed of non-negative values.
The $rho_i$ are therefore positive.

So according to @eq-1, we can construct:

$
  I/2 &= rho \
  <==> I &= 2 rho \
  <==> I &= 2 sum_i p_i rho_i \
  <==> I &= 1/2 rho_1 + 1/2 rho_2 + 1/2 rho_3 + 1/2 rho_4 \
$

So we can define the POVM as ${E_i = 1/2 rho_i = 1/2 |X_i chevron.r chevron X_i|}_(i in {1, 2, 3, 4})$.

As used in page 534 of Quantum Computation and Quantum Information: 10th Anniversary Edition @Nielsen_Chuang_2010,
the joint distribution $p(x, y)$ satisfies $p(x, y) = p(x)p(y|x) = p(x)tr(rho_x E_y)$.

So we can compute $p(y|x) &= tr(rho_x E_y)$ for $x, y in {1, 2, 3, 4}$ with $p(x) = p_i$ the probability of Alice to send $|X_i chevron.r$.

We can construct a matrix of probabilities $p(y|x)$ as follow:

$
  &mat(p(y = 1|x = 1), p(y = 2|x = 1), p(y = 3|x = 1), p(y = 4|x = 1); p(y = 1|x = 2), p(y = 2|x = 2), p(y = 3|x = 2), p(y = 4|x = 2); p(y = 1|x = 3), p(y = 2|x = 3), p(y = 3|x = 3), p(y = 4|x = 3); p(y = 1|x = 4), p(y = 2|x = 4), p(y = 3|x = 4), p(y = 4|x = 4)) \
  =&mat(p_1 tr(rho_1 E_1), p_1 tr(rho_1 E_2), p_1 tr(rho_1 E_3), p_1 tr(rho_1 E_4); p_2 tr(rho_2 E_1), p_2 tr(rho_2 E_2), p_2 tr(rho_2 E_3), p_2 tr(rho_2 E_4); p_3 tr(rho_3 E_1), p_3 tr(rho_3 E_2), p_3 tr(rho_3 E_3), p_3 tr(rho_3 E_4); p_4 tr(rho_4 E_1), p_4 tr(rho_4 E_2), p_4 tr(rho_4 E_3), p_4 tr(rho_4 E_4)) \
  =&mat(1/4 tr(1/2 rho_1 rho_1), 1/4 tr(1/2 rho_1 rho_2), 1/4 tr(1/2 rho_1 rho_3), 1/4 tr(1/2 rho_1 rho_4); 1/4 tr(1/2 rho_2 rho_1), 1/4 tr(1/2 rho_2 rho_2), 1/4 tr(1/2 rho_2 rho_3), 1/4 tr(1/2 rho_2 rho_4); 1/4 tr(1/2 rho_3 rho_1), 1/4 tr(1/2 rho_3 rho_2), 1/4 tr(1/2 rho_3 rho_3), 1/4 tr(1/2 rho_3 rho_4); 1/4 tr(1/2 rho_4 rho_1), 1/4 tr(1/2 rho_4 rho_2), 1/4 tr(1/2 rho_4 rho_3), 1/4 tr(1/2 rho_4 rho_4)) \
$

As $p_1 = p_2 = p_3 = p_4 = 1/4$, the matrix is symetric.

We have:

$
  1/4 tr(1/2 rho_1 rho_1)
  &= 1/4 tr(1/2 mat(1, 0; 0, 0) mat(1, 0; 0, 0)) \
  &= 1/4 dot 1/2 \
  &= 1/8
$

$
  1/4 tr(1/2 rho_1 rho_2)
  &= 1/4 tr(1/2 mat(1, 0; 0, 0)1/3 mat(1, sqrt(2); sqrt(2), 2)) \
  &= 1/4 dot 1/2 dot 1/3 \
  &= 1/24
$

$
  1/4 tr(1/2 rho_1 rho_3)
  &= 1/4 tr(1/2 mat(1, 0; 0, 0)1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)) \
  &= 1/4 dot 1/2 dot 1/3 \
  &= 1/24
$
$
  1/4 tr(1/2 rho_1 rho_4)
  &= 1/4 tr(1/2 mat(1, 0; 0, 0)1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 1/4 dot 1/2 dot 1/3 \
  &= 1/24
$
$
  1/4 tr(1/2 rho_2 rho_2)
  &= 1/4 tr(1/2 1/3 mat(1, sqrt(2); sqrt(2), 2)1/3 mat(1, sqrt(2); sqrt(2), 2)) \
  &= 1/4 tr(1/18 mat(3, 3 sqrt(2); 3 sqrt(2), 6)) \
  &= 1/4 dot (3/18 + 6/18) \
  &= 1/4 dot 1/2 \
  &= 1/8
$
$
  1/4 tr(1/2 rho_2 rho_3)
  &= 1/4 tr(1/2 1/3 mat(1, sqrt(2); sqrt(2), 2)1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)) \
  &= 1/4 tr(1/18 mat(1 + 2e^(2 pi i \/ 3), sqrt(2)(1 + 2e^(-2 pi i \/ 3)); sqrt(2)(1 + 2e^(2 pi i \/ 3)), 4 + 2e^(-2 pi i \/ 3))) \
  &= 1/4 dot 1/18 dot (1 + 2e^(2 pi i \/ 3) + 4 + 2e^(-2 pi i \/ 3)) \
  &= 1/4 dot 1/18 dot (5 + 2(e^(2 pi i \/ 3) + e^(-2 pi i \/ 3))) \
  &= 1/4 dot 1/18 dot (5 + 2(-1/2 + i sqrt(3)/2 - 1/2 - i sqrt(3)/2)) \
  &= 1/4 dot 1/18 dot (5 - 2) \
  &= 1/24
$
$
  1/4 tr(1/2 rho_2 rho_4)
  &= 1/4 tr(1/2 1/3 mat(1, sqrt(2); sqrt(2), 2)1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 1/4 tr(1/18 mat(1 + 2e^(4 pi i \/ 3), sqrt(2)(1 + 2e^(-4 pi i \/ 3)); sqrt(2)(1 + 2e^(4 pi i \/ 3)), 4 + 2e^(-4 pi i \/ 3))) \
  &= 1/4 dot 1/18 dot (1 + 2e^(4 pi i \/ 3) + 4 + 2e^(-4 pi i \/ 3)) \
  &= 1/4 dot 1/18 dot (5 + 2(e^(4 pi i \/ 3) + e^(-4 pi i \/ 3))) \
   &= 1/4 dot 1/18 dot (5 + 2(-1/2 - i sqrt(3)/2 - 1/2 + i sqrt(3)/2)) \
   &= 1/24
$
$
  1/4 tr(1/2 rho_3 rho_3)
  &= 1/4 tr(1/2 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)) \
  &= 1/4 tr(1/18 mat(3, 3 sqrt(2) e^(-2 pi i \/ 3); 3 sqrt(2) e^(2 pi i \/ 3), 6)) \
  &= 1/4 dot (3/18 + 6/18) \
  &= 1/8
$
$
  1/4 tr(1/2 rho_3 rho_4)
  &= 1/4 tr(1/2 1/3 mat(1, sqrt(2) e^(-2 pi i \/ 3); sqrt(2) e^(2 pi i \/ 3), 2)1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 1/4 tr(1/18 mat(1 + 2e^(4 pi i \/ 3), sqrt(2)(1 + 2e^(-4 pi i \/ 3)); sqrt(2)(1 + 2e^(4 pi i \/ 3)), 4 + 2e^(-4 pi i \/ 3))) \
  &= 1/4 dot 1/18 dot (5 + 2(e^(4 pi i \/ 3) + e^(-4 pi i \/ 3))) \
  &= 1/4 dot 1/18 dot (5 + 2(-1/2 - i sqrt(3)/2 - 1/2 + i sqrt(3)/2)) \
  &= 1/24
$
$  1/4 tr(1/2 rho_4 rho_4)
  &= 1/4 tr(1/2 1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)1/3 mat(1, sqrt(2) e^(-4 pi i \/ 3); sqrt(2) e^(4 pi i \/ 3), 2)) \
  &= 1/4 tr(1/18 mat(3, 3 sqrt(2) e^(-4 pi i \/ 3); 3 sqrt(2) e^(4 pi i \/ 3), 6)) \
  &= 1/4 dot (3/18 + 6/18) \
  &= 1/8
$

So the matrix of probabilities is:
$
  p(y|x) = &mat(1/4 tr(1/2 rho_1 rho_1), 1/4 tr(1/2 rho_1 rho_2), 1/4 tr(1/2 rho_1 rho_3), 1/4 tr(1/2 rho_1 rho_4); 1/4 tr(1/2 rho_2 rho_1), 1/4 tr(1/2 rho_2 rho_2), 1/4 tr(1/2 rho_2 rho_3), 1/4 tr(1/2 rho_2 rho_4); 1/4 tr(1/2 rho_3 rho_1), 1/4 tr(1/2 rho_3 rho_2), 1/4 tr(1/2 rho_3 rho_3), 1/4 tr(1/2 rho_3 rho_4); 1/4 tr(1/2 rho_4 rho_1), 1/4 tr(1/2 rho_4 rho_2), 1/4 tr(1/2 rho_4 rho_3), 1/4 tr(1/2 rho_4 rho_4)) \
  &= mat(1/8, 1/24, 1/24, 1/24; 1/24, 1/8, 1/24, 1/24; 1/24, 1/24, 1/8, 1/24; 1/24, 1/24, 1/24, 1/8)
$

// So Alice's system has no information at all, so the knowledge of Alice's system indicate nothing on Bob's system.
// So the mutual information is equal to 0 bit, which is less than 1 bit. 


#v(2em)

#text(weight: "bold")[
  To archive all results (solutions, report together with your code, etc.) and submit them using Quantum computing course moodle.
]
